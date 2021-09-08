import 'package:flutter/material.dart';
import 'package:pocket_planner/models/class_models/label_model.dart';

enum TaskStatus {
  pending,
  finished,
}

class Task {
  String taskName;
  String taskDesc;
  DateTime dueDate;
  TimeOfDay taskTime;
  Label label;
  TaskStatus status;
  bool shouldRemind;
  bool isHabit;
  //use -1 for one time tasks
  int projectId;

  Task({
    this.projectId,
    this.label,
    this.shouldRemind = false,
    this.isHabit = false,
    this.taskDesc,
    this.taskTime,
    this.status = TaskStatus.pending,
    this.dueDate,
    this.taskName,
  });
}
