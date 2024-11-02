import 'package:json_annotation/json_annotation.dart';
import 'package:yaroorm/yaroorm.dart';

part 'models.g.dart';

@table
@JsonSerializable()
class Post extends Entity<Post> {
  @PrimaryKey()
  final int id;
  final String title;
  final String description;

  @bindTo(User)
  final int ownerId;

  Post(
    this.id,
    this.title,
    this.description, {
    required this.ownerId,
  });

  BelongsTo<Post, User> get owner => belongsTo(#owner);

  Map<String, dynamic> toJson() => _$PostToJson(this);

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}

@JsonSerializable()
@table
class User extends Entity<User> {
  @primaryKey
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
