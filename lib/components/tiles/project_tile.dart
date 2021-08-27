import 'package:flutter/material.dart';
import 'package:pocket_planner/models/class_models/project_model.dart';

import '../../constants.dart';

class ProjectTile extends StatelessWidget {
  final Project project;

  ProjectTile({
    this.project,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: Colors.white),
        child: Padding(
            padding: const EdgeInsets.only(
                right: 20.0, left: 20, top: 15, bottom: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                project.label != null
                    ? Text(
                        project.label.labelName,
                        style: kSubTitleStyle.copyWith(
                            color: project.label.labelColor, fontSize: 16),
                      )
                    : Container(),
                Divider(
                  thickness: 1.5,
                  color: kColorMap['kGrey'].withOpacity(.2),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Container(
                          height: 37,
                          width: 3,
                          decoration: BoxDecoration(
                              color: project.label != null
                                  ? project.label.labelColor
                                  : kColorMap['kGrey'],
                              borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            project.projectName,
                            style: kTitleStyle.copyWith(
                                color: Colors.black, fontSize: 18),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )));
  }
}
