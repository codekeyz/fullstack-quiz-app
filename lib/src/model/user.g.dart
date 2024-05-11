// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: (json['id'] as num).toInt(),
      username: json['username'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
    };

// **************************************************************************
// EntityGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names

Query<User> get UserQuery => DB.query<User>();
CreateSchema get UserSchema => Schema.fromEntity<User>();
EntityTypeDefinition<User> get userTypeDef => EntityTypeDefinition<User>(
      "users",
      timestampsEnabled: false,
      columns: [
        DBEntityField.primaryKey(
          "id",
          int,
          #id,
          autoIncrement: true,
        ),
        DBEntityField(
          "username",
          String,
          #username,
        ),
        DBEntityField(
          "email",
          String,
          #email,
        ),
        DBEntityField(
          "password",
          String,
          #password,
        )
      ],
      mirror: _$UserEntityMirror.new,
      build: (args) => User(
        email: args[#email],
        id: args[#id],
        password: args[#password],
        username: args[#username],
      ),
    );

class _$UserEntityMirror extends EntityMirror<User> {
  const _$UserEntityMirror(super.instance);

  @override
  Object? get(Symbol field) {
    return switch (field) {
      #id => instance.id,
      #username => instance.username,
      #email => instance.email,
      #password => instance.password,
      _ => throw Exception('Unknown property $field'),
    };
  }
}

class OrderUserBy extends OrderBy<User> {
  const OrderUserBy.username({OrderDirection order = OrderDirection.asc})
      : super("username", order);

  const OrderUserBy.email({OrderDirection order = OrderDirection.asc})
      : super("email", order);

  const OrderUserBy.password({OrderDirection order = OrderDirection.asc})
      : super("password", order);
}

class NewUser extends CreateEntity<User> {
  const NewUser({
    required this.username,
    required this.email,
    required this.password,
  });

  final String username;

  final String email;

  final String password;

  @override
  Map<Symbol, dynamic> get toMap =>
      {#username: username, #email: email, #password: password};
}

class UpdateUser extends UpdateEntity<User> {
  const UpdateUser({
    this.username = const NoValue(),
    this.email = const NoValue(),
    this.password = const NoValue(),
  });

  final value<String> username;

  final value<String> email;

  final value<String> password;

  @override
  Map<Symbol, dynamic> get toMap => {
        if (username is! NoValue) #username: username.val!,
        if (email is! NoValue) #email: email.val!,
        if (password is! NoValue) #password: password.val!,
      };
}

extension UserWhereBuilderExtension on WhereClauseBuilder<User> {
  WhereClauseValue id(int value) => $equal<int>("id", value);
  WhereClauseValue username(String value) => $equal<String>("username", value);
  WhereClauseValue email(String value) => $equal<String>("email", value);
  WhereClauseValue password(String value) => $equal<String>("password", value);
}

extension UserWhereHelperExtension on Query<User> {
  Future<User?> findById(int val) => findOne(where: (user) => user.id(val));
  Future<User?> findByUsername(String val) =>
      findOne(where: (user) => user.username(val));
  Future<User?> findByEmail(String val) =>
      findOne(where: (user) => user.email(val));
  Future<User?> findByPassword(String val) =>
      findOne(where: (user) => user.password(val));
}

extension UserRelationsBuilder on JoinBuilder<User> {}
