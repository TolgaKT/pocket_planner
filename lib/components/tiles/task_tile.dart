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
          height: 120,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: Colors.white),
          child: Padding(
              padding: const EdgeInsets.only(
                  right: 20.0, left: 20, top: 15, bottom: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.label.labelName,
                    style: kSubTitleStyle.copyWith(
                        color: task.label.labelColor, fontSize: 16),
                  ),
                  Divider(
                    thickness: 1.5,
                    color: kGrey.withOpacity(.2),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Container(
                            height: 37,
                            width: 3,
                            decoration: BoxDecoration(
                                color: task.label.labelColor,
                                borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              task.taskName,
                              style: kTitleStyle.copyWith(
                                  color: Colors.black, fontSize: 18),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              task.taskDesc,
                              style: kSubTitleStyle.copyWith(
                                  color: kGrey, fontSize: 14),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ))),
    );
  }
}
