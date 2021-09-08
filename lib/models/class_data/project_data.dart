import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:pocket_planner/models/class_models/label_model.dart';
import 'package:pocket_planner/models/class_models/project_model.dart';
import 'package:pocket_planner/models/class_models/task_model.dart';

class ProjectData extends ChangeNotifier {
  List<Project> _projects = [
    Project(
        tasks: [Task(), Task()],
        projectName: 'Web UI design',
        label: Label(labelColor: Colors.yellow, labelName: 'Deneme')),
    Project(
      tasks: [Task(), Task()],
      projectName: 'Web UI design',
    ),
    Project(
        tasks: [Task(), Task()],
        projectName: 'Web UI design',
        label: Label(labelColor: Colors.yellow, labelName: 'Deneme')),
  ];

  UnmodifiableListView<Project> get projects => UnmodifiableListView(_projects);

  int get projectsCount => _projects.length;

  int getProjectTasks(Project project) {
    return _projects.firstWhere((element) => element == project).tasks.length;
  }

  int getFinishedTasks(Project project) {
    return _projects
        .firstWhere((element) => element == project)
        .tasks
        .where((element) => element.status == TaskStatus.finished)
        .length;
  }

  void addProjects(Project project) {
    _projects.add(project);
    notifyListeners();
  }

  void deleteProject(Project project) {
    _projects.remove(project);
    notifyListeners();
  }

  void clearProjects() {
    _projects = [];
    notifyListeners();
  }
}
