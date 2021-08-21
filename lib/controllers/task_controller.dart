import 'package:flutter/cupertino.dart';
import 'package:pocket_planner/models/class_data/task_data.dart';
import 'package:pocket_planner/models/class_models/task_model.dart';
import 'package:provider/provider.dart';

class TaskController {
  static void createTask(Task task, BuildContext context) {
    Provider.of<TaskData>(context, listen: false).addTask(task);
  }

  static void deleteTask(Task task, BuildContext context) {
    Provider.of<TaskData>(context, listen: false).deleteTask(task);
  }

  static void editTask(Task task, String edit, BuildContext context) {
    Provider.of<TaskData>(context, listen: false).editTask(task, edit);
  }

  static void markAsComplete(Task task, BuildContext context) {
    Provider.of<TaskData>(context, listen: false).markAsComplete(task);
  }
}
