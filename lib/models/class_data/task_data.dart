import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:pocket_planner/models/class_models/task_model.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [];

  UnmodifiableListView<Task> getTasks(
      DateTime selectedDate, TaskStatus status) {
    return UnmodifiableListView(_tasks
        .where((element) =>
            element.status == status && element.dueDate == selectedDate)
        .toList());
  }

  int getTaskCount(DateTime selectedDate, TaskStatus status) {
    return _tasks
        .where((element) =>
            element.status == status && element.dueDate == selectedDate)
        .length;
  }

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void editTask(Task task, Task newTask) {
    Task foundTask = _tasks.firstWhere((element) => element == task);

    if (newTask.taskName != null) {
      foundTask.taskName = newTask.taskName;
    }
    if (newTask.taskDesc != null) {
      foundTask.taskDesc = newTask.taskDesc;
    }
    if (newTask.dueDate != null) {
      foundTask.dueDate = newTask.dueDate;
    }
    foundTask.label = newTask.label;
    notifyListeners();
  }

  void undoFinished(Task task) {
    _tasks.firstWhere((element) => element == task).status = TaskStatus.pending;
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
