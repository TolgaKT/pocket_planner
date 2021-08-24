import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:pocket_planner/components/custom_date_picker.dart';
import 'package:pocket_planner/components/lists/mini_label_list.dart';
import 'package:pocket_planner/components/rounded_button.dart';
import 'package:pocket_planner/constants.dart';
import 'package:pocket_planner/controllers/label_controller.dart';
import 'package:pocket_planner/controllers/task_controller.dart';
import 'package:pocket_planner/models/class_models/label_model.dart';
import 'package:pocket_planner/models/class_models/task_model.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  FocusNode _nameNode;
  TextEditingController _nameController = TextEditingController();
  FocusNode _descriptionNode;
  TextEditingController _descriptionController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  Label selectedLabel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController.addListener(() {});
    _nameNode = FocusNode();
    _descriptionNode = FocusNode();
    _descriptionController.addListener(() {});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _descriptionController.dispose();
    _nameController.dispose();
    _nameNode.dispose();
    _descriptionNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Add Task',
                  style: kTitleStyle.copyWith(fontSize: 26),
                ),
                SizedBox(
                  height: 55,
                ),
                Text(
                  'TASK NAME',
                  style: kSubTitleStyle.copyWith(fontSize: 15),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 0),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: kColorMap['kGrey']),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: kColorMap['kGrey']),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: kColorMap['kGrey']),
                    ),
                    hintStyle: TextStyle(fontSize: 16.0, color: Colors.white),
                  ),
                  focusNode: _nameNode,
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 35,
                ),
                Text(
                  'TASK DESCRIPTION',
                  style: kSubTitleStyle.copyWith(fontSize: 15),
                ),
                TextFormField(
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 0),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: kColorMap['kGrey']),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: kColorMap['kGrey']),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: kColorMap['kGrey']),
                    ),
                    hintStyle: TextStyle(fontSize: 16.0, color: Colors.white),
                  ),
                  focusNode: _descriptionNode,
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 35,
                ),
                Text(
                  'DUE DATE',
                  style: kSubTitleStyle.copyWith(fontSize: 15),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom:
                            BorderSide(width: 1.0, color: kColorMap['kGrey']),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          DateFormat('dd-MM-yyyy').format(selectedDate),
                          style: kSubTitleStyle,
                        ),
                        IconButton(
                            icon: FaIcon(
                              FontAwesomeIcons.calendar,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return CustomDatePicker();
                                  }).then((value) {
                                setState(() {
                                  if (value != null) {
                                    selectedDate = value;
                                  }
                                });
                              });
                            }),
                      ],
                    )),
                LabelController.getLabelCount(context) > 0
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 35,
                          ),
                          Text(
                            'LABEL',
                            style: kSubTitleStyle.copyWith(fontSize: 15),
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
                SizedBox(
                  height: 35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RoundedButton(
                      buttonColor: Colors.grey,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      buttonChild: Text('Cancel'),
                      height: 50,
                      width: 140,
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    RoundedButton(
                      buttonColor: Colors.blueAccent,
                      onPressed: () {
                        TaskController.createTask(
                            Task(
                                taskDesc: _descriptionController.text,
                                taskName: _nameController.text,
                                dueDate: DateTime(selectedDate.year,
                                    selectedDate.month, selectedDate.day),
                                label:
                                    LabelController.getSelectedLabel(context)),
                            context);
                        LabelController.removeSelection(context);
                        Navigator.pop(context);
                      },
                      buttonChild: Text('Create'),
                      height: 50,
                      width: 140,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
