import 'package:yaroorm/yaroorm.dart';
import 'package:path/path.dart' as path;

@DB.useConfig
final config = YaroormConfig('test_db', connections: [
  DatabaseConnection(
    'test_db',
    DatabaseDriverType.sqlite,
    database: path.absolute('database/sqlite.db'),
  )
]);
