import 'package:flutter/material.dart';
import 'package:pocket_planner/models/class_models/project_model.dart';

import '../../constants.dart';

class ProjectTile extends StatelessWidget {
  final Project project;

  ProjectTile({
    this.project,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: kColorMap['kGrey'].withOpacity(.4)),
        child: Padding(
            padding: const EdgeInsets.only(
                right: 20.0, left: 20, top: 15, bottom: 15),
            child: Text(project.projectName)));
  }
}
