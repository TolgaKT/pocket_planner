import 'package:flutter/material.dart';
import 'package:pocket_planner/components/lists/task_list.dart';
import 'package:pocket_planner/components/rounded_button.dart';
import 'package:pocket_planner/components/task_adder.dart';
import 'package:pocket_planner/constants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Today',
                    style: kTitleStyle.copyWith(fontSize: 26),
                  ),
                  RoundedButton(
                    radius: 10,
                    height: 40,
                    width: 120,
                    buttonColor: kLightBlue,
                    buttonChild: Text(
                      '+ Add Task',
                      style: kTitleStyle.copyWith(fontSize: 16),
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                          backgroundColor: Colors.white.withOpacity(0),
                          context: context,
                          builder: (BuildContext context) {
                            return TaskAdder();
                          });
                    },
                  ),
                ],
              )),
          Expanded(child: TaskList()),
        ],
      )),
    );
  }
}
