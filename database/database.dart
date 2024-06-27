// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:quiz_app/src/config.dart' as config;
import 'package:quiz_app/src/model/post.dart';
import 'package:quiz_app/src/model/user.dart';
import 'package:yaroorm/yaroorm.dart';

import 'migrations/2024_05_11_173502_create_users_table.dart' as _m0;
import 'migrations/2024_06_27_141624_create_posts_table.dart' as _m1;

void initializeORM() {
  /// Add Type Definitions to Query Runner
  Query.addTypeDef<Post>(postTypeDef);
  Query.addTypeDef<User>(userTypeDef);

  /// Configure Migrations Order
  DB.migrations.addAll([
    _m0.AddUsersTable(),
    _m1.CreatePostsTable(),
  ]);

  DB.init(config.config);
}
