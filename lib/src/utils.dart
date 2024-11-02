import 'package:ez_validator_dart/ez_validator.dart';

final EzSchema registerUserValidator = EzSchema.shape(
  {
    "email": EzValidator<String>().required().email(),
    "password": EzValidator<String>().required().minLength(8),
    "username": EzValidator<String>().required().minLength(3),
  },
);

final EzSchema loginUserValidator = EzSchema.shape(
  {
    "email": EzValidator<String>().required().email(),
    "password": EzValidator<String>().required(),
  },
);
