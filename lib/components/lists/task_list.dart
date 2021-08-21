import 'package:flutter/material.dart';
import 'package:pocket_planner/components/tiles/task_tile.dart';
import 'package:pocket_planner/models/class_data/task_data.dart';
import 'package:pocket_planner/models/class_models/task_model.dart';
import 'package:provider/provider.dart';

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, projectData, child) {
        return Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 20,
              );
            },
            itemCount: projectData.projectsCount,
            itemBuilder: (context, index) {
              Task task = projectData.tasks[index];
              return TaskTile(
                task: task,
              );
            },
          ),
        );
      },
    );
  }
}
