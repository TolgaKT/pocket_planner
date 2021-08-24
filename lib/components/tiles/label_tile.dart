import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pocket_planner/constants.dart';
import 'package:pocket_planner/controllers/label_controller.dart';
import 'package:pocket_planner/models/class_models/label_model.dart';

class LabelTile extends StatelessWidget {
  final Label label;

  LabelTile({this.label});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      secondaryActions: [
        IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            LabelController.deleteLabel(label, context);
          },
          color: kColorMap['kMainRed'],
        ),
      ],
      child: Column(
        children: [
          Container(
            height: 60,
            width: 600,
            child: Center(
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                        color: label.labelColor, shape: BoxShape.circle),
                    child: Icon(
                      Icons.label,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    label.labelName,
                    style: kSubTitleStyle.copyWith(fontSize: 20),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Divider(
              thickness: 1,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
