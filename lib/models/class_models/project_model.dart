import 'package:pocket_planner/models/class_models/label_model.dart';
import 'package:pocket_planner/models/class_models/task_model.dart';

class Project {
  List<Task> tasks;
  String projectName;
  Label label;

  Project({this.projectName, this.tasks, this.label});
}
