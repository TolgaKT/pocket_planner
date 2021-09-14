import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:pocket_planner/components/custom_date_picker.dart';
import 'package:pocket_planner/components/custom_text_field.dart';
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
  TextEditingController _descriptionController = TextEditingController();
  FocusNode _descriptionNode;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  Label selectedLabel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController.addListener(() {});
    _nameNode = FocusNode();
    _descriptionController.addListener(() {});
    _descriptionNode = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameController.dispose();
    _nameNode.dispose();
    _descriptionNode.dispose();
    _descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorMap['kMainWhite'],
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
          'Create Task',
          style: kTitleStyle.copyWith(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Task Title',
                  style: kSubTitleStyle.copyWith(
                      fontSize: 15, color: Colors.black),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(node: _nameNode, controller: _nameController),
                SizedBox(
                  height: 35,
                ),
                Text(
                  'Task Description',
                  style: kSubTitleStyle.copyWith(
                      fontSize: 15, color: Colors.black),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    node: _descriptionNode, controller: _descriptionController),
                SizedBox(
                  height: 35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'TASK DATE',
                          style: kSubTitleStyle.copyWith(
                              fontSize: 15, color: Colors.black),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.black)),
                            child: Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    DateFormat('dd-MM-yyyy')
                                        .format(selectedDate),
                                    style: kSubTitleStyle.copyWith(
                                        color: Colors.black),
                                  ),
                                  IconButton(
                                      icon: FaIcon(
                                        FontAwesomeIcons.calendar,
                                        color: Colors.black,
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
                              ),
                            )),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'TASK TIME',
                          style: kSubTitleStyle.copyWith(
                              fontSize: 15, color: Colors.black),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.black)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Text(
                                    selectedTime.format(context),
                                    style: kSubTitleStyle.copyWith(
                                        color: Colors.black),
                                  ),
                                ),
                                IconButton(
                                    icon: FaIcon(
                                      FontAwesomeIcons.clock,
                                      color: Colors.black,
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).push(showPicker(
                                          is24HrFormat: true,
                                          value: TimeOfDay.now(),
                                          onChange: (TimeOfDay time) {
                                            setState(() {
                                              selectedTime = time;
                                            });
                                          }));
                                    }),
                              ],
                            )),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
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
                SizedBox(
                  height: 35,
                ),
                Center(
                  child: RoundedButton(
                    buttonColor: kColorMap['kMainPurple'],
                    onPressed: () {
                      TaskController.createTask(
                          Task(
                              taskTime: selectedTime,
                              taskDesc: _descriptionController.text,
                              taskName: _nameController.text,
                              dueDate: DateTime(selectedDate.year,
                                  selectedDate.month, selectedDate.day),
                              labelId: LabelController.getSelectedLabel(
                                          context) !=
                                      null
                                  ? LabelController.getSelectedLabel(context)
                                      .labelId
                                  : -1),
                          context);
                      LabelController.removeSelection(context);
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
        ),
      ),
    );
  }
}
