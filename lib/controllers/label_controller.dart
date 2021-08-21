import 'package:flutter/material.dart';
import 'package:pocket_planner/models/class_data/label_data.dart';
import 'package:pocket_planner/models/class_models/label_model.dart';
import 'package:provider/provider.dart';

class LabelController {
  static void createLabel(Label label, BuildContext context) {
    Provider.of<LabelData>(context, listen: false).addLabel(label);
  }

  static void deleteTask(Label label, BuildContext context) {
    Provider.of<LabelData>(context, listen: false).deleteLabel(label);
  }
}
