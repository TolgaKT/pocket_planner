import 'package:flutter/material.dart';
import 'package:pocket_planner/components/tiles/label_tile.dart';
import 'package:pocket_planner/models/class_data/label_data.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';

class LabelList extends StatefulWidget {
  @override
  _LabelListState createState() => _LabelListState();
}

class _LabelListState extends State<LabelList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LabelData>(
      builder: (context, labelData, child) {
        return labelData.labelCount > 0
            ? Column(
                children: labelData.labels
                    .map((e) => LabelTile(
                          label: e,
                        ))
                    .toList(),
              )
            : Container(
                height: 75,
                width: MediaQuery.of(context).size.width,
                child: Center(
                    child: Text(
                  '''You don't have any labels''',
                  style: kSubTitleStyle.copyWith(
                      fontSize: 18, color: Colors.black),
                )),
                decoration: BoxDecoration(
                    color: kColorMap['kGrey'].withOpacity(.2),
                    borderRadius: BorderRadius.circular(15)),
              );
      },
    );
  }
}
