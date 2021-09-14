import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pocket_planner/controllers/label_controller.dart';
import 'package:pocket_planner/controllers/task_controller.dart';
import 'package:pocket_planner/models/class_models/label_model.dart';
import 'package:pocket_planner/models/class_models/task_model.dart';
import 'package:pocket_planner/views/edit_task_screen.dart';

import '../../constants.dart';

class TaskTile extends StatefulWidget {
  final Task task;
  TaskTile({
    this.task,
  });

  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  Label label;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      label = LabelController.getLabelFromId(widget.task.labelId, context);
    });
  }

  @override
  Widget build(BuildContext context) {
    SlidableController controller = SlidableController();
    return Slidable(
      controller: controller,
      closeOnScroll: true,
      secondaryActions: widget.task.status == TaskStatus.pending
          ? <Widget>[
              IconButton(
                icon: FaIcon(FontAwesomeIcons.trash),
                onPressed: () {
                  controller.activeState.close();
                  TaskController.deleteTask(widget.task, context);
                },
                color: kColorMap['kMainRed'],
              ),
              IconButton(
                icon: FaIcon(FontAwesomeIcons.edit),
                onPressed: () {
                  controller.activeState.close();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditTaskScreen(
                                task: widget.task,
                              )));
                },
                color: kColorMap['kMainYellow'],
              ),
              IconButton(
                icon: FaIcon(FontAwesomeIcons.check),
                onPressed: () {
                  controller.activeState.close();
                  TaskController.markAsComplete(widget.task, context);
                },
                color: kColorMap['kMainCyan'],
              ),
            ]
          : <Widget>[
              IconButton(
                icon: FaIcon(FontAwesomeIcons.undo),
                onPressed: () {
                  controller.activeState.close();
                  TaskController.undoFinished(widget.task, context);
                },
                color: kColorMap['kMainYellow'],
              ),
            ],
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: label != null
                  ? kColorMap[label.labelColor].withOpacity(.4)
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
                            widget.task.taskName,
                            style: kTitleStyle.copyWith(
                                color: Colors.black, fontSize: 18),
                          ),
                          widget.task.status == TaskStatus.pending
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
                        widget.task.taskDesc,
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
                              Text(widget.task.taskTime.format(context)),
                            ],
                          ),
                          label != null
                              ? Container(
                                  height: 40,
                                  width: 80,
                                  child: Center(
                                    child: Text(
                                      label.labelName,
                                      style: kSubTitleStyle,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      color: kColorMap[label.labelColor],
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
