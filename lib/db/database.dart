import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MainDatabase {
  static final MainDatabase instance = MainDatabase._init();

  static Database _database;

  MainDatabase._init();

  Future<Database> get database async {
    if (_database == null) {
      _database = await _initDB('database.db');
    }
    return _database;
  }

  Future<Database> _initDB(String filePath) async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE tasks (
    
    
    
    )
    
    
    ''');
  }

  Future<void> closeDB() async {
    Database db = await instance.database;
    await db.close();
  }
}
