import 'package:flutter/material.dart';
import 'package:pocket_planner/components/lists/project_list.dart';
import 'package:pocket_planner/components/lists/task_list.dart';
import 'package:pocket_planner/constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorMap['kMainWhite'],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ongoing Projects',
                style: kTitleStyle.copyWith(color: Colors.black, fontSize: 20),
              ),
              ProjectList(),
              Text(
                'Today Tasks',
                style: kTitleStyle.copyWith(color: Colors.black, fontSize: 20),
              ),
              Expanded(
                child: TaskList(
                  selectedDate: DateTime(DateTime.now().year,
                      DateTime.now().month, DateTime.now().day),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
