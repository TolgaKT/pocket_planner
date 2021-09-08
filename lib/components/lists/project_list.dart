import 'package:flutter/material.dart';
import 'package:pocket_planner/components/tiles/project_tile.dart';
import 'package:pocket_planner/models/class_data/project_data.dart';
import 'package:pocket_planner/models/class_models/project_model.dart';
import 'package:provider/provider.dart';

class ProjectList extends StatefulWidget {
  @override
  _ProjectListState createState() => _ProjectListState();
}

class _ProjectListState extends State<ProjectList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProjectData>(
      builder: (context, projectData, child) {
        return ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 121),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(width: 20);
            },
            itemCount: projectData.projectsCount,
            itemBuilder: (context, index) {
              Project project = projectData.projects[index];
              return ProjectTile(
                project: project,
              );
            },
          ),
        );
      },
    );
  }
}
