import 'package:json_annotation/json_annotation.dart';
import 'package:quiz_app/src/model/post.dart';
import 'package:yaroorm/yaroorm.dart';

part 'user.g.dart';

@JsonSerializable()
@table
class User extends Entity<User> {
  @autoIncrementPrimary
  final int id;

  final String username;
  final String email;

  @JsonKey(includeToJson: false)
  final String password;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
  });

  HasMany<User, Post> get posts => hasMany(#posts);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
