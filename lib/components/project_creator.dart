import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pocket_planner/components/custom_text_field.dart';
import 'package:pocket_planner/components/rounded_button.dart';
import 'package:pocket_planner/controllers/label_controller.dart';
import 'package:pocket_planner/controllers/project_controller.dart';
import 'package:pocket_planner/models/class_models/label_model.dart';
import 'package:pocket_planner/models/class_models/project_model.dart';

import '../constants.dart';
import 'lists/mini_label_list.dart';

class ProjectCreator extends StatefulWidget {
  @override
  _ProjectCreatorState createState() => _ProjectCreatorState();
}

class _ProjectCreatorState extends State<ProjectCreator> {
  FocusNode _nameNode;
  TextEditingController _nameController = TextEditingController();
  Label selectedLabel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController.addListener(() {});
    _nameNode = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameController.dispose();
    _nameNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: FaIcon(
                FontAwesomeIcons.times,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              })
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: kColorMap['kGrey'].withOpacity(.4),
            height: 1.0,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: kColorMap['kMainWhite'],
        title: Text(
          'Create Project',
          style: kTitleStyle.copyWith(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Project Name',
              style: kSubTitleStyle.copyWith(fontSize: 15, color: Colors.black),
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextField(node: _nameNode, controller: _nameController),
            SizedBox(
              height: 35,
            ),
            LabelController.getLabelCount(context) > 0
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'LABEL',
                        style: kSubTitleStyle.copyWith(
                            fontSize: 15, color: Colors.black),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        constraints: BoxConstraints(
                            maxHeight: 150,
                            maxWidth: MediaQuery.of(context).size.width),
                        child: MiniLabelList(),
                      ),
                    ],
                  )
                : Container(),
            Center(
              child: RoundedButton(
                buttonColor: kColorMap['kMainPurple'],
                onPressed: () {
                  ProjectController.createProject(
                      Project(
                          taskIds: [],
                          projectName: _nameController.text,
                          labelId:
                              LabelController.getSelectedLabel(context) != null
                                  ? LabelController.getSelectedLabel(context)
                                      .labelId
                                  : -1),
                      context);
                  Navigator.pop(context);
                },
                buttonChild: Text('Create'),
                height: 50,
                width: 250,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
