import 'package:quiz_app/src/models.dart';
import 'package:yaroorm/yaroorm.dart';

class AddUsersTable extends Migration {
  @override
  void up(List<Schema> schemas) {
    schemas.addAll([UserSchema, PostSchema]);
  }

  @override
  void down(List<Schema> schemas) {
    schemas.addAll([
      Schema.dropIfExists(UserSchema),
      Schema.dropIfExists(PostSchema),
    ]);
  }
}
