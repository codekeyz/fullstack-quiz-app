import 'package:quiz_app/src/model/post.dart';
import 'package:yaroorm/yaroorm.dart';

class CreatePostsTable extends Migration {
  @override
  void up(List<Schema> schemas) {
    schemas.add(PostSchema);
  }

  @override
  void down(List<Schema> schemas) {
    schemas.add(Schema.dropIfExists(PostSchema));
  }
}
