import 'package:flutter/material.dart';
import 'package:pocket_planner/components/tiles/project_tile.dart';
import 'package:pocket_planner/models/class_data/project_data.dart';
import 'package:pocket_planner/models/class_models/project_model.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';

class ProjectList extends StatefulWidget {
  @override
  _ProjectListState createState() => _ProjectListState();
}

class _ProjectListState extends State<ProjectList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProjectData>(
      builder: (context, projectData, child) {
        return projectData.projectsCount > 0
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: projectData.projectsCount,
                itemBuilder: (context, index) {
                  Project project = projectData.projects[index];
                  return ProjectTile(
                    project: project,
                  );
                },
              )
            : Container(
                height: 75,
                width: MediaQuery.of(context).size.width,
                child: Center(
                    child: Text(
                  '''You don't have any ongoing projects''',
                  style: kSubTitleStyle.copyWith(
                      fontSize: 18, color: Colors.black),
                )),
                decoration: BoxDecoration(
                    color: kColorMap['kGrey'].withOpacity(.2),
                    borderRadius: BorderRadius.circular(15)),
              );
      },
    );
  }
}
