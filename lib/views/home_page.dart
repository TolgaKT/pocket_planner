import 'package:flutter/material.dart';
import 'package:pocket_planner/components/lists/task_list.dart';
import 'package:pocket_planner/components/rounded_button.dart';
import 'package:pocket_planner/constants.dart';
import 'package:pocket_planner/models/class_models/task_model.dart';
import 'package:pocket_planner/views/add_task_screen.dart';
import 'package:pocket_planner/views/dashboard.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime selectedDate = DateTime.now();
  List<TaskStatus> statusList = [TaskStatus.pending, TaskStatus.finished];
  int selectedStatusIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorMap['kMainWhite'],
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: Icon(
                      Icons.dashboard_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Dashboard()));
                    },
                  ),
                ),
              ),
            ],
          ),
          Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, top: 20, bottom: 20, right: 20),
              child: Text(
                'Today',
                style: kTitleStyle.copyWith(fontSize: 26, color: Colors.black),
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
