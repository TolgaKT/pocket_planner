import 'package:flutter/material.dart';
import 'package:pocket_planner/constants.dart';
import 'package:pocket_planner/models/class_models/project_model.dart';

class ProjectTile extends StatelessWidget {
  final Project project;

  ProjectTile({this.project});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 45,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: kColorMap['kMainBlue'],
            spreadRadius: .2,
            blurRadius: .2,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ], borderRadius: BorderRadius.circular(12), color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.only(right: 20.0, left: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.attach_file),
              Text(
                project.projectName,
                style: kTitleStyle.copyWith(fontSize: 18),
              ),
            ],
          ),
        ));
  }
}
