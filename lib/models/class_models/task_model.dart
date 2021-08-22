import 'package:pocket_planner/models/class_models/label_model.dart';

enum TaskStatus {
  pending,
  finished,
}

class Task {
  String taskName;
  String taskDesc;
  DateTime dueDate;
  Label label;
  TaskStatus status;

  //use -1 for one time tasks
  int projectId;

  Task({
    this.projectId,
    this.taskDesc,
    this.label,
    this.status = TaskStatus.pending,
    this.dueDate,
    this.taskName,
  });
}
