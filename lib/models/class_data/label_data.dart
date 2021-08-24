import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:pocket_planner/models/class_models/label_model.dart';

class LabelData extends ChangeNotifier {
  List<Label> _labels = [];

  Label _selectedLabel;

  Label get selectedLabel => _selectedLabel;

  int get labelCount => _labels.length;

  UnmodifiableListView<Label> get labels => UnmodifiableListView(_labels);

  void addLabel(Label label) {
    _labels.add(label);
    notifyListeners();
  }

  void selectLabel(Label label) {
    _selectedLabel = label;
    notifyListeners();
  }

  void removeSelection() {
    _selectedLabel = null;
    notifyListeners();
  }

  void deleteLabel(Label label) {
    _labels.remove(label);
    notifyListeners();
  }
}
