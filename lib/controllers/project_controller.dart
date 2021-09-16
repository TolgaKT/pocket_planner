import 'package:flutter/cupertino.dart';
import 'package:pocket_planner/db/project_db.dart';
import 'package:pocket_planner/models/class_data/project_data.dart';
import 'package:pocket_planner/models/class_models/project_model.dart';
import 'package:provider/provider.dart';

class ProjectController {
  static Future<void> getProjects(BuildContext context) async {
    List<Project> projects = await ProjectDB.getAllProjects();
    Provider.of<ProjectData>(context, listen: false).overwrite(projects);
  }

  static Future<void> createProject(
      Project project, BuildContext context) async {
    Project newProject = await ProjectDB.createProject(project);
    Provider.of<ProjectData>(context, listen: false).addProject(newProject);
  }

  static Future<void> deleteTask(
      Project project, int taskId, BuildContext context) async {
    await ProjectDB.deleteTask(project, taskId);
    Provider.of<ProjectData>(context, listen: false)
        .deleteTask(project, taskId);
  }

  static Future<void> addTask(
      Project project, int taskId, BuildContext context) async {
    await ProjectDB.addTask(project, taskId);
    Provider.of<ProjectData>(context, listen: false).addTask(project, taskId);
  }

  static Future<void> deleteProject(
      Project project, BuildContext context) async {
    await ProjectDB.deleteProject(project);
    Provider.of<ProjectData>(context, listen: false).deleteProject(project);
  }
}
