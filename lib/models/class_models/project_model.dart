import 'package:pocket_planner/models/class_models/task_model.dart';

class Project {
  int projectId;
  List<Task> tasks;
  String projectName;

  Project({this.projectName, this.projectId, this.tasks});
}
