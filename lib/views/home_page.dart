import 'package:flutter/material.dart';
import 'package:pocket_planner/components/lists/task_list.dart';
import 'package:pocket_planner/components/rounded_button.dart';
import 'package:pocket_planner/constants.dart';
import 'package:pocket_planner/views/add_task_screen.dart';
import 'package:pocket_planner/views/dashboard.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, top: 20, bottom: 20, right: 20),
              child: Text(
                'Today',
                style: kTitleStyle.copyWith(fontSize: 26),
              )),
          Expanded(
              child: TaskList(
            selectedDate: DateTime(
                selectedDate.year, selectedDate.month, selectedDate.day),
          )),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0, left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RoundedButton(
                  radius: 10,
                  height: 40,
                  width: 120,
                  buttonColor: kColorMap['kLightBlue'],
                  buttonChild: Text(
                    'Dashboard',
                    style: kTitleStyle.copyWith(fontSize: 16),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Dashboard()));
                  },
                ),
                RoundedButton(
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
              ],
            ),
          )
        ],
      )),
    );
  }
}
