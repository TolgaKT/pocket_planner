import 'package:flutter/material.dart';
import 'package:pocket_planner/components/label_creator.dart';
import 'package:pocket_planner/components/lists/label_list.dart';
import 'package:pocket_planner/components/menu_button.dart';
import 'package:pocket_planner/constants.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorMap['kMainWhite'],
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MenuButton(
                  color: kColorMap['kGrey'].withOpacity(.5),
                  icon: Icon(
                    Icons.repeat_rounded,
                    color: Colors.white,
                    size: 20,
                  ),
                  buttonText: 'Habits',
                  iconBgColor: kColorMap['kMainYellow'],
                ),
                SizedBox(height: 10,),
                MenuButton(
                  color: kColorMap['kGrey'].withOpacity(.5),
                  icon: Icon(
                    Icons.pie_chart,
                    color: Colors.white,
                    size: 20,
                  ),
                  buttonText: 'Statistics',
                  iconBgColor: kColorMap['kMainRed'],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'LABELS',
                      style: kTitleStyle.copyWith(
                          fontSize: 20, color: Colors.black),
                    ),
                    TextButton(
                        onPressed: () {
                          showModalBottomSheet(
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
