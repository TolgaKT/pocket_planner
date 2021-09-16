import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:pocket_planner/models/class_models/task_model.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [];

  UnmodifiableListView<Task> getTasks(DateTime selectedDate) {
    return UnmodifiableListView(
        _tasks.where((element) => element.dueDate == selectedDate).toList());
  }

  int getTaskCount(DateTime selectedDate) {
    return _tasks.where((element) => element.dueDate == selectedDate).length;
  }

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void overwrite(List<Task> tasks) {
    _tasks = tasks;
    notifyListeners();
  }

  void editTask(Task task, Task newTask) {
    _tasks[_tasks.indexWhere((element) => element.taskId == task.taskId)] =
        newTask;
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
