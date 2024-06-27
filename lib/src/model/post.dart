import 'package:json_annotation/json_annotation.dart';
import 'package:quiz_app/src/model/user.dart';
import 'package:yaroorm/yaroorm.dart';

part 'post.g.dart';

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
