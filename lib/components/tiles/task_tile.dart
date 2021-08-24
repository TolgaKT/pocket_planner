import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pocket_planner/controllers/task_controller.dart';
import 'package:pocket_planner/models/class_models/task_model.dart';
import 'package:pocket_planner/views/edit_task_screen.dart';

import '../../constants.dart';

class TaskTile extends StatelessWidget {
  final Task task;

  TaskTile({
    this.task,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      secondaryActions: task.status == TaskStatus.pending
          ? <Widget>[
              IconButton(
                icon: FaIcon(FontAwesomeIcons.trash),
                onPressed: () {
                  TaskController.deleteTask(task, context);
                },
                color: kColorMap['kMainRed'],
              ),
              IconButton(
                icon: FaIcon(FontAwesomeIcons.edit),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditTaskScreen(
                                task: task,
                              )));
                },
                color: kColorMap['kMainYellow'],
              ),
              IconButton(
                icon: FaIcon(FontAwesomeIcons.check),
                onPressed: () {
                  TaskController.markAsComplete(task, context);
                },
                color: kColorMap['kMainCyan'],
              ),
            ]
          : <Widget>[
              IconButton(
                icon: FaIcon(FontAwesomeIcons.undo),
                onPressed: () {
                  TaskController.undoFinished(task, context);
                },
                color: kColorMap['kMainYellow'],
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
                  task.label != null
                      ? Text(
                          task.label.labelName,
                          style: kSubTitleStyle.copyWith(
                              color: task.label.labelColor, fontSize: 16),
                        )
                      : Container(),
                  Divider(
                    thickness: 1.5,
                    color: kColorMap['kGrey'].withOpacity(.2),
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
                                color: task.label != null
                                    ? task.label.labelColor
                                    : kColorMap['kGrey'],
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
                                  color: kColorMap['kGrey'], fontSize: 14),
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
