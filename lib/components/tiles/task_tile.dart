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
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: task.label != null
                  ? task.label.labelColor.withOpacity(.4)
                  : kColorMap['kGrey'].withOpacity(.4)),
          child: Padding(
              padding: const EdgeInsets.only(
                  right: 20.0, left: 20, top: 15, bottom: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            task.taskName,
                            style: kTitleStyle.copyWith(
                                color: Colors.black, fontSize: 18),
                          ),
                          task.status == TaskStatus.pending
                              ? Container()
                              : FaIcon(
                                  FontAwesomeIcons.solidCheckCircle,
                                  color: Colors.greenAccent,
                                ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        task.taskDesc,
                        style: kSubTitleStyle.copyWith(
                            color: kColorMap['kGrey'], fontSize: 14),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Divider(
                        thickness: 1.5,
                        color: kColorMap['kGrey'].withOpacity(.2),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              FaIcon(FontAwesomeIcons.clock),
                              SizedBox(
                                width: 10,
                              ),
                              Text(task.taskTime.format(context)),
                            ],
                          ),
                          task.label != null
                              ? Container(
                                  height: 40,
                                  width: 80,
                                  child: Center(
                                    child: Text(
                                      task.label.labelName,
                                      style: kSubTitleStyle,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      color: task.label.labelColor,
                                      borderRadius: BorderRadius.circular(15)),
                                )
                              : Container()
                        ],
                      )
                    ],
                  ),
                ],
              ))),
    );
  }
}
