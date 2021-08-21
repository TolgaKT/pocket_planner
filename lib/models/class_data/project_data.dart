import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:pocket_planner/models/class_models/project_model.dart';
import 'package:pocket_planner/models/class_models/task_model.dart';

class ProjectData extends ChangeNotifier {
  List<Project> _projects = [
    Project(
        projectId: 1, tasks: [Task(), Task()], projectName: 'Web UI design'),
    Project(
        projectId: 1, tasks: [Task(), Task()], projectName: 'Web UI design'),
    Project(
        projectId: 1, tasks: [Task(), Task()], projectName: 'Web UI design'),
    Project(projectId: 1, tasks: [Task(), Task()], projectName: 'Web UI design')
  ];

  UnmodifiableListView<Project> get projects => UnmodifiableListView(_projects);

  int get projectsCount => _projects.length;

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
