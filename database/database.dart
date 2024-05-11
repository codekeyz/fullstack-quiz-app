// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:quiz_app/src/model/user.dart';
import 'package:yaroorm/yaroorm.dart';

import './config.dart' as config;
import 'migrations/2024_05_11_173502_create_users_table.dart' as _m0;

void initializeORM() {
  /// Add Type Definitions to Query Runner
  Query.addTypeDef<User>(userTypeDef);

  /// Configure Migrations Order
  DB.migrations.addAll([
    _m0.AddUsersTable(),
  ]);

  DB.init(config.config);
}
