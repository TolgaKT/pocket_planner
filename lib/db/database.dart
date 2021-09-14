import 'package:path/path.dart';
import 'package:pocket_planner/models/class_models/label_model.dart';
import 'package:pocket_planner/models/class_models/task_model.dart';
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
    final textType = 'TEXT NOT NULL';
    final intType = 'INT';
    await db.execute('''
    CREATE TABLE labels (
      labelId $idType,
      labelColor $textType,
      labelName $textType )
    ''');

    await db.execute('''
      CREATE TABLE tasks (
        taskId: $idType,
        taskName: $textType,
        taskDesc: $textType,
        dueDate: $textType,
        taskTime: $textType,
        labelId: $intType,
        status: $intType,
        shouldRemind: $intType,
        latitude: $textType,
        longitude: $textType,
        isOverdue: $intType
      )
    ''');
  }

  Future<Task> createTask(Task task) async {
    final db = await instance.database;
    final id = await db.insert('tasks', task.toJson());
    return Task(
      labelId: task.labelId,
      taskTime: task.taskTime,
      taskDesc: task.taskDesc,
      taskName: task.taskName,
      taskId: id,
      longitude: task.longitude,
      latitude: task.latitude,
      status: task.status,
      shouldRemind: task.shouldRemind,
      dueDate: task.dueDate,
      isOverdue: task.isOverdue,
    );
  }

  Future<void> deleteTask(Task task) async {
    final db = await instance.database;
    await db.delete('tasks', where: 'taskId = ?', whereArgs: [task.taskId]);
  }

  Future<List<Task>> getAllTasks() async {
    final db = await instance.database;

    final result = await db.query('task');
    if (result.isNotEmpty) {
      return result.map((e) => Task.fromDB(e)).toList();
    }
    return [];
  }

  Future<Label> createLabel(Label label) async {
    final db = await instance.database;
    final id = await db.insert('labels', label.toJson());
    return Label(
        labelName: label.labelName, labelColor: label.labelColor, labelId: id);
  }

  Future<void> deleteLabel(Label label) async {
    final db = await instance.database;
    await db.delete('labels', where: 'labelId = ?', whereArgs: [label.labelId]);
  }

  Future<List<Label>> getAllLabels() async {
    final db = await instance.database;

    final result = await db.query('labels');
    if (result.isNotEmpty) {
      return result.map((e) => Label.fromDB(e)).toList();
    }
    return [];
  }

  Future<void> closeDB() async {
    Database db = await instance.database;
    await db.close();
  }
}
