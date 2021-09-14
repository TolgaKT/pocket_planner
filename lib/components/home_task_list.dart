import 'package:flutter/material.dart';
import 'package:pocket_planner/components/tiles/task_tile.dart';
import 'package:pocket_planner/models/class_data/task_data.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class HomeTaskList extends StatefulWidget {
  final DateTime selectedDate;

  HomeTaskList({this.selectedDate});

  @override
  _HomeTaskListState createState() => _HomeTaskListState();
}

class _HomeTaskListState extends State<HomeTaskList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return taskData.getTaskCount(widget.selectedDate) > 0
            ? Column(
                children: taskData
                    .getTasks(widget.selectedDate)
                    .map((e) => TaskTile(
                          task: e,
                        ))
                    .toList(),
              )
            : Container(
                height: 75,
                width: MediaQuery.of(context).size.width,
                child: Center(
                    child: Text(
                  '''You don't have any tasks today''',
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
