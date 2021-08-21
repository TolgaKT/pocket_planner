import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:pocket_planner/constants.dart';
import 'package:pocket_planner/models/class_models/label_model.dart';
import 'package:pocket_planner/models/class_models/task_model.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(
        projectId: 1,
        label: Label(labelName: 'Urgent', labelColor: kMainRed),
        status: TaskStatus.pending,
        taskName: 'UI Design'),
    Task(
      projectId: 1,
      status: TaskStatus.pending,
      taskName: 'UI Design',
      label: Label(labelName: 'Shopping', labelColor: kMainYellow),
    ),
    Task(
      projectId: 1,
      status: TaskStatus.pending,
      taskName: 'UI Design',
      label: Label(labelName: 'Urgent', labelColor: kMainBlue),
    ),
    Task(
      projectId: 1,
      status: TaskStatus.pending,
      taskName: 'UI Design',
      label: Label(labelName: 'Urgent', labelColor: kMainRed),
    ),
    Task(
      projectId: 1,
      status: TaskStatus.pending,
      taskName: 'UI Design',
      label: Label(labelName: 'Urgent', labelColor: kMainRed),
    ),
  ];

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks
      .where((element) => element.status != TaskStatus.finished)
      .toList());

  int get projectsCount =>
      _tasks.where((element) => element.status != TaskStatus.finished).length;

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
