import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:pocket_planner/models/class_models/project_model.dart';

class ProjectData extends ChangeNotifier {
  List<Project> _projects = [];

  UnmodifiableListView<Project> get projects => UnmodifiableListView(_projects);

  int get projectsCount => _projects.length;

  void overwrite(List<Project> projects) {
    _projects = projects;
    notifyListeners();
  }

  int getProjectTasks(Project project) {
    return _projects.firstWhere((element) => element == project).taskIds.length;
  }

  void addProject(Project project) {
    _projects.add(project);
    notifyListeners();
  }

  void addTask(Project project, int taskId) {
    _projects
        .firstWhere((element) => element.projectId == project.projectId)
        .taskIds
        .add(taskId);
    notifyListeners();
  }

  void deleteTask(Project project, int taskId) {
    _projects
        .firstWhere((element) => element.projectId == project.projectId)
        .taskIds
        .remove(taskId);
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
