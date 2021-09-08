import 'package:flutter/material.dart';
import 'package:pocket_planner/components/lists/project_list.dart';

class ProjectsScreen extends StatefulWidget {
  @override
  _ProjectsScreenState createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Expanded(
          child: ProjectList(),
        ),
      ),
    );
  }
}
