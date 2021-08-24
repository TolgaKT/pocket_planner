import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:pocket_planner/models/class_models/task_model.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [];

  UnmodifiableListView<Task> getTasks(DateTime selectedDate) {
    return UnmodifiableListView(_tasks
        .where((element) =>
            element.status != TaskStatus.finished &&
            element.dueDate == selectedDate)
        .toList());
  }

  int getTaskCount(DateTime selectedDate) {
    return _tasks
        .where((element) =>
            element.status != TaskStatus.finished &&
            element.dueDate == selectedDate)
        .length;
  }

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void editTask(Task task, String edit) {
    _tasks.firstWhere((element) => element == task).taskName = edit;
    notifyListeners();
  }

  void markAsComplete(Task task) {
    _tasks.firstWhere((element) => element == task).status =
        TaskStatus.finished;
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  void clearTasks() {
    _tasks = [];
    notifyListeners();
  }
}
