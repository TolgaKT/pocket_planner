import 'package:flutter/material.dart';
import 'package:pocket_planner/components/tiles/task_tile.dart';
import 'package:pocket_planner/models/class_data/task_data.dart';
import 'package:pocket_planner/models/class_models/task_model.dart';
import 'package:provider/provider.dart';

class TaskList extends StatefulWidget {
  final DateTime selectedDate;

  TaskList({
    this.selectedDate,
  });

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 15,
              );
            },
            itemCount: taskData.getTaskCount(widget.selectedDate),
            itemBuilder: (context, index) {
              Task task = taskData.getTasks(widget.selectedDate)[index];
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
