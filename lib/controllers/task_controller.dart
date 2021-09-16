import 'package:flutter/cupertino.dart';
import 'package:pocket_planner/db/task_db.dart';
import 'package:pocket_planner/models/class_data/task_data.dart';
import 'package:pocket_planner/models/class_models/task_model.dart';
import 'package:provider/provider.dart';

class TaskController {
  static Future<void> createTask(Task task, BuildContext context) async {
    Task newTask = await TaskDB.createTask(task);
    Provider.of<TaskData>(context, listen: false).addTask(newTask);
  }

  static Future<void> getTasks(BuildContext context) async {
    List<Task> labels = await TaskDB.getAllTasks();
    Provider.of<TaskData>(context, listen: false).overwrite(labels);
  }

  static Future<void> deleteTask(Task task, BuildContext context) async {
    await TaskDB.deleteTask(task);
    Provider.of<TaskData>(context, listen: false).deleteTask(task);
  }

  static Future<void> editTask(
      Task task, Task newTask, BuildContext context) async {
    await TaskDB.editTask(newTask);
    Provider.of<TaskData>(context, listen: false).editTask(task, newTask);
  }

  static Future<void> undoFinished(Task task, BuildContext context) async {
    await TaskDB.undoFinished(task);
    Provider.of<TaskData>(context, listen: false).undoFinished(task);
  }

  static Future<void> markAsComplete(Task task, BuildContext context) async {
    await TaskDB.markAsComplete(task);
    Provider.of<TaskData>(context, listen: false).markAsComplete(task);
  }
}
