import 'package:flutter/material.dart';
import 'package:pocket_planner/components/tiles/mini_label_tile.dart';
import 'package:pocket_planner/models/class_data/label_data.dart';
import 'package:provider/provider.dart';

class MiniLabelList extends StatefulWidget {
  @override
  _MiniLabelListState createState() => _MiniLabelListState();
}

class _MiniLabelListState extends State<MiniLabelList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LabelData>(
      builder: (context, labelData, child) {
        return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 10,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 4),
                crossAxisCount: 3,
                crossAxisSpacing: 15),
            itemCount: labelData.labelCount,
            itemBuilder: (context, index) {
              return MiniLabelTile(
                label: labelData.labels[index],
              );
            });
      },
    );
  }
}
