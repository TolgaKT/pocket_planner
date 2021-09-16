import 'package:flutter/material.dart';

enum TaskStatus {
  pending,
  finished,
}

class Task {
  String taskName;
  String taskDesc;
  DateTime dueDate;
  TimeOfDay taskTime;
  int taskId;
  int labelId;
  TaskStatus status;
  bool shouldRemind;
  double latitude;
  double longitude;
  bool isOverdue;

  Task({
    this.latitude = -1,
    this.longitude = -1,
    this.labelId = -1,
    this.shouldRemind = false,
    this.isOverdue = false,
    this.taskDesc,
    this.taskTime,
    this.taskId,
    this.status = TaskStatus.pending,
    this.dueDate,
    this.taskName,
  });

  factory Task.fromDB(Map<String, dynamic> json) {
    return Task(
        taskId: json['taskId'],
        taskName: json['taskName'],
        taskDesc: json['taskDesc'],
        dueDate: DateTime.parse(json['dueDate']),
        taskTime: TimeOfDay(
            hour: int.parse(json['taskTime'].toString().split(':')[0]),
            minute: int.parse(json['taskTime'].toString().split(':')[1])),
        labelId: json['labelId'],
        status: json['status'] == 1 ? TaskStatus.finished : TaskStatus.pending,
        shouldRemind: json['shouldRemind'] == 1 ? true : false,
        latitude: double.parse(json['latitude']),
        longitude: double.parse(json['longitude']),
        isOverdue: json['isOverdue'] == 1 ? true : false);
  }

  Map<String, dynamic> toJson() {
    return {
      'taskId': taskId,
      'taskName': taskName,
      'taskDesc': taskDesc,
      'dueDate': dueDate.toString(),
      'taskTime': taskTime.toString().substring(10, 15),
      'labelId': labelId,
      'status': status == TaskStatus.finished ? 1 : 0,
      'shouldRemind': shouldRemind ? 1 : 0,
      'latitude': latitude.toString(),
      'longitude': longitude.toString(),
      'isOverdue': isOverdue ? 1 : 0
    };
  }
}
