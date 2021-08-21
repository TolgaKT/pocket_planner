import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:pocket_planner/models/class_models/label_model.dart';

class LabelData extends ChangeNotifier {
  List<Label> _labels = [];

  int get labelCount => _labels.length;

  UnmodifiableListView<Label> get labels => UnmodifiableListView(_labels);

  void addLabel(Label label) {
    _labels.add(label);
    notifyListeners();
  }

  void deleteLabel(Label label) {
    _labels.remove(label);
    notifyListeners();
  }
}
