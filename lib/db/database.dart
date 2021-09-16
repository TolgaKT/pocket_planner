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
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT';
    final intType = 'INTEGER';
    await db.execute('''
    CREATE TABLE labels (
      labelId $idType,
      labelColor $textType,
      labelName $textType )
    ''');

    await db.execute('''
      CREATE TABLE tasks (
        taskId $idType,
        taskName $textType,
        taskDesc $textType,
        dueDate $textType,
        taskTime $textType,
        labelId $intType,
        status $intType,
        shouldRemind $intType,
        latitude $textType,
        longitude $textType,
        isOverdue $intType
      )
    ''');

    await db.execute('''
    CREATE TABLE projects (
    projectId $idType,
    projectName $textType,
    labelId $intType,
    taskIds $textType
    )
    ''');
  }

  Future<void> closeDB() async {
    Database db = await instance.database;
    await db.close();
  }
}
