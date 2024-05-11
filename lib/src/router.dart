// Configure routes.
import 'dart:convert';
import 'dart:io';

import 'package:bcrypt/bcrypt.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:dotenv/dotenv.dart';
import 'package:quiz_app/src/model/user.dart';
import 'package:quiz_app/src/utils.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:yaroorm/yaroorm.dart';

final env = DotEnv(includePlatformEnvironment: true)..load();
final _jwtSecret = SecretKey(env['JWT_SECRET']!);

final router = Router()
  ..post('/login', _loginHandler)
  ..post('/register', _registerHandler)
  ..get('/current-user', _getCurrentuser);

Future<Response> _getCurrentuser(Request req) async {
  // Check for presence of jwt token in request header
  final jwtToken =
      req.headers[HttpHeaders.authorizationHeader]?.split(' ').lastOrNull;
  if (jwtToken == null) {
    return Response.unauthorized('Not Authorized');
  }

  // Verify JWT Token
  final jwtVerified = JWT.tryVerify(jwtToken, _jwtSecret);
  if (jwtVerified == null) {
    return Response.unauthorized('Not Authorized');
  }

  return Response.ok(jsonEncode({'user': jwtVerified.payload}));
}

Future<Response> _loginHandler(Request req) async {
  final requestBody = Map<String, dynamic>.from(
    jsonDecode(await req.readAsString()),
  );

  // Validate request body
  final validatedResult = loginUserValidator.validateSync(requestBody);
  final errors = validatedResult.$2;
  if (errors.isNotEmpty) {
    return Response.badRequest(body: jsonEncode(errors));
  }

  final validatedBody = Map<String, dynamic>.from(validatedResult.$1);
  final email = validatedBody['email'];

  // Check if user exists or compare if the password doesn't match
  final user = await UserQuery.where((user) => user.email(email)).findOne();
  if (user == null ||
      !BCrypt.checkpw(validatedBody['password'], user.password)) {
    return Response.unauthorized('Either email or password is invalid');
  }

  // Generate jwt token for user with user data in payload
  final jwt = JWT(user.toJson()).sign(
    _jwtSecret,
    expiresIn: Duration(days: 1),
  );

  return Response.ok(jsonEncode({'token': jwt}));
}

Future<Response> _registerHandler(Request req) async {
  final requestBody = Map<String, dynamic>.from(
    jsonDecode(await req.readAsString()),
  );

  // Validate request body
  final validatedResult = registerUserValidator.validateSync(requestBody);
  final errors = validatedResult.$2;
  if (errors.isNotEmpty) {
    return Response.badRequest(body: jsonEncode(errors));
  }

  final validatedBody = Map<String, dynamic>.from(validatedResult.$1);
  final username = validatedBody['username'];
  final email = validatedBody['email'];

  // Check if we have any user with this email or username
  final anyUserWithEitherEmailOrUsername = await UserQuery.where((user) => or([
        user.email(email),
        user.username(username),
      ])).exists();

  if (anyUserWithEitherEmailOrUsername) {
    return Response.badRequest(body: 'Either Username or Email already exists');
  }

  // Hash user password before saving to DB
  final hashedPassword =
      BCrypt.hashpw(validatedBody['password'], BCrypt.gensalt());

  // Save user to DB
  final user = await UserQuery.insert(NewUser(
    username: username,
    email: email,
    password: hashedPassword,
  ));

  return Response.ok(jsonEncode({'user': user.toJson()}));
}
