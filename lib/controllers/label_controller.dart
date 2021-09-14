import 'package:flutter/material.dart';
import 'package:pocket_planner/db/database.dart';
import 'package:pocket_planner/models/class_data/label_data.dart';
import 'package:pocket_planner/models/class_models/label_model.dart';
import 'package:provider/provider.dart';

class LabelController {
  static void getLabels(BuildContext context) async {
    List<Label> labels = await MainDatabase.instance.getAllLabels();
    Provider.of<LabelData>(context, listen: false).overwrite(labels);
  }

  static Label getLabelFromId(int id, BuildContext context) {
    return Provider.of<LabelData>(context, listen: false).getLabel(id);
  }

  static void createLabel(Label label, BuildContext context) async {
    Label newLabel = await MainDatabase.instance.createLabel(label);
    Provider.of<LabelData>(context, listen: false).addLabel(newLabel);
  }

  static void deleteLabel(Label label, BuildContext context) async {
    await MainDatabase.instance.deleteLabel(label);
    Provider.of<LabelData>(context, listen: false).deleteLabel(label);
  }

  static void selectLabel(Label label, BuildContext context) {
    Provider.of<LabelData>(context, listen: false).selectLabel(label);
  }

  static void removeSelection(BuildContext context) {
    Provider.of<LabelData>(context, listen: false).removeSelection();
  }

  static Label getSelectedLabel(BuildContext context) {
    return Provider.of<LabelData>(context, listen: false).selectedLabel;
  }

  static int getLabelCount(BuildContext context) {
    return Provider.of<LabelData>(context, listen: false).labelCount;
  }
}
