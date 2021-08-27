import 'package:flutter/material.dart';
import 'package:pocket_planner/components/lists/task_list.dart';
import 'package:pocket_planner/components/rounded_button.dart';
import 'package:pocket_planner/components/top_calendar.dart';
import 'package:pocket_planner/constants.dart';
import 'package:pocket_planner/models/class_models/task_model.dart';
import 'package:pocket_planner/views/add_task_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime selectedDate = DateTime.now();
  List<TaskStatus> statusList = [TaskStatus.pending, TaskStatus.finished];
  int selectedStatusIndex = 0;

  void _updateDate(DateTime newDate) {
    setState(() {
      selectedDate = newDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorMap['kMainWhite'],
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: TopCalendar(
                parentAction: _updateDate,
              )),
          Expanded(
              child: TaskList(
            selectedDate: DateTime(
                selectedDate.year, selectedDate.month, selectedDate.day),
          )),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0, left: 15, right: 15),
            child: Align(
              alignment: Alignment.bottomRight,
              child: RoundedButton(
                  radius: 10,
                  height: 40,
                  width: 120,
                  buttonColor: kColorMap['kLightBlue'],
                  buttonChild: Text(
                    '+ Add Task',
                    style: kTitleStyle.copyWith(fontSize: 16),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddTaskScreen()));
                  }),
            ),
          )
        ],
      )),
    );
  }
}
