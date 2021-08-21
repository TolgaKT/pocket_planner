import 'package:flutter/material.dart';
import 'package:pocket_planner/components/lists/task_list.dart';
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              backgroundColor: Colors.white.withOpacity(0),
              context: context,
              builder: (BuildContext context) {
                return TaskAdder();
              });
        },
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20, bottom: 20),
            child: Text(
              'Today',
              style: kTitleStyle.copyWith(fontSize: 26),
            ),
          ),
          Expanded(child: TaskList()),
        ],
      )),
    );
  }
}
