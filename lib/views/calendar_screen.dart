import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pocket_planner/components/lists/task_list.dart';
import 'package:pocket_planner/components/top_calendar.dart';
import 'package:pocket_planner/constants.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime selectedDate = DateTime.now();

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
            ),
          ),
        ],
      )),
    );
  }
}
