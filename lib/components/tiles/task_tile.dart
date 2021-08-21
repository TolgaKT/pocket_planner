import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pocket_planner/controllers/task_controller.dart';
import 'package:pocket_planner/models/class_models/task_model.dart';

import '../../constants.dart';

class TaskTile extends StatelessWidget {
  final Task task;

  TaskTile({
    this.task,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      secondaryActions: <Widget>[
        IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            TaskController.deleteTask(task, context);
          },
          color: kMainRed,
        ),
        IconButton(
          icon: Icon(Icons.edit),
          onPressed: () {},
          color: kMainYellow,
        ),
        IconButton(
          icon: Icon(Icons.check),
          onPressed: () {
            TaskController.markAsComplete(task, context);
          },
          color: kMainCyan,
        ),
      ],
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Container(
          height: 45,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: kDarkCyan,
                  spreadRadius: .2,
                  blurRadius: .2,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: kMainGradient)),
          child: Padding(
            padding: const EdgeInsets.only(right: 20.0, left: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  task.taskName,
                  style: kTitleStyle.copyWith(fontSize: 18),
                ),
                task.label != null
                    ? Container(
                        child: Center(
                          child: Text(
                            task.label.labelName,
                            style: kSubTitleStyle,
                          ),
                        ),
                        height: 30,
                        width: 80,
                        decoration: BoxDecoration(
                            color: task.label.labelColor,
                            borderRadius: BorderRadius.circular(15)),
                      )
                    : Container()
              ],
            ),
          )),
    );
  }
}
