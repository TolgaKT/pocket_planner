import 'package:flutter/material.dart';
import 'package:pocket_planner/components/home_task_list.dart';
import 'package:pocket_planner/components/label_creator.dart';
import 'package:pocket_planner/components/lists/label_list.dart';
import 'package:pocket_planner/constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorMap['kMainWhite'],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 25, left: 15.0, right: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '''Today's Tasks''',
                  style:
                      kTitleStyle.copyWith(color: Colors.black, fontSize: 20),
                ),
                SizedBox(
                  height: 15,
                ),
                HomeTaskList(
                  selectedDate: DateTime(today.year, today.month, today.day),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Labels',
                      style: kTitleStyle.copyWith(
                          fontSize: 20, color: Colors.black),
                    ),
                    TextButton(
                        onPressed: () {
                          showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (BuildContext context) {
                                return LabelCreator();
                              });
                        },
                        child: Text(
                          '+ Add Label',
                          style: kSubTitleStyle.copyWith(
                              fontSize: 16, color: Colors.black),
                        ))
                  ],
                ),
                LabelList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
