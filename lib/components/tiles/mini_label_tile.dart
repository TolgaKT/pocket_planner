import 'package:flutter/material.dart';
import 'package:pocket_planner/constants.dart';
import 'package:pocket_planner/controllers/label_controller.dart';
import 'package:pocket_planner/models/class_models/label_model.dart';

class MiniLabelTile extends StatelessWidget {
  final Label label;

  MiniLabelTile({this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (LabelController.getSelectedLabel(context) == label) {
          LabelController.removeSelection(context);
        } else {
          LabelController.selectLabel(label, context);
        }
      },
      child: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
            border: Border.all(
                width: 2,
                color: LabelController.getSelectedLabel(context) == label
                    ? Colors.black
                    : kColorMap['kMainWhite']),
            color: kColorMap[label.labelColor].withOpacity(.5),
            borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: Text(
            label.labelName,
            style: kSubTitleStyle,
          ),
        ),
      ),
    );
  }
}
