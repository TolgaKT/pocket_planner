import 'package:flutter/material.dart';
import 'package:pocket_planner/components/tiles/label_tile.dart';
import 'package:pocket_planner/models/class_data/label_data.dart';
import 'package:provider/provider.dart';

class LabelList extends StatefulWidget {
  @override
  _LabelListState createState() => _LabelListState();
}

class _LabelListState extends State<LabelList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LabelData>(
      builder: (context, labelData, child) {
        return Column(
          children: labelData.labels
              .map((e) => LabelTile(
                    label: e,
                  ))
              .toList(),
        );
      },
    );
  }
}
