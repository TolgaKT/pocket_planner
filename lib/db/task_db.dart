import 'package:pocket_planner/db/database.dart';
import 'package:pocket_planner/models/class_models/task_model.dart';

class TaskDB {
  static Future<Task> createTask(Task task) async {
    final db = await MainDatabase.instance.database;
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

  static Future<void> deleteTask(Task task) async {
    final db = await MainDatabase.instance.database;
    await db.delete('tasks', where: 'taskId = ?', whereArgs: [task.taskId]);
  }

  static Future<List<Task>> getAllTasks() async {
    final db = await MainDatabase.instance.database;

    final result = await db.query('tasks');
    if (result.isNotEmpty) {
      return result.map((e) => Task.fromDB(e)).toList();
    }
    return [];
  }

  static Future<void> editTask(Task task) async {
    final db = await MainDatabase.instance.database;
    await db.update('tasks', task.toJson(),
        where: 'taskId = ?', whereArgs: [task.taskId]);
  }

  static Future<void> markAsComplete(Task task) async {
    final db = await MainDatabase.instance.database;
    await db.rawQuery('''
      UPDATE tasks SET status = 1 WHERE taskId = ${task.taskId}
   
    ''');
  }

  static Future<void> undoFinished(Task task) async {
    final db = await MainDatabase.instance.database;
    await db.rawUpdate('''
    UPDATE tasks SET status = 0 WHERE taskId = ${task.taskId}''');
  }
}
