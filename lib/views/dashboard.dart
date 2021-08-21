import 'package:flutter/material.dart';
import 'package:pocket_planner/components/label_adder.dart';
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
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dashboard',
                  style: kTitleStyle.copyWith(fontSize: 26),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12, bottom: 12),
                  child: Text(
                    'MENU',
                    style: kSubTitleStyle.copyWith(fontSize: 15),
                  ),
                ),
                Container(
                  width: 600,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xff3d3b3b)),
                  child: Column(
                    children: [
                      MenuButton(
                        icon: Icon(
                          Icons.calendar_today,
                          color: Colors.white,
                          size: 20,
                        ),
                        buttonText: 'Calendar',
                        iconBgColor: kMainBlue,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey,
                        ),
                      ),
                      MenuButton(
                        icon: Icon(
                          Icons.repeat_rounded,
                          color: Colors.white,
                          size: 20,
                        ),
                        buttonText: 'Habits',
                        iconBgColor: kMainYellow,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey,
                        ),
                      ),
                      MenuButton(
                        icon: Icon(
                          Icons.pie_chart,
                          color: Colors.white,
                          size: 20,
                        ),
                        buttonText: 'Statistics',
                        iconBgColor: kMainRed,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'LABELS',
                          style: kSubTitleStyle.copyWith(fontSize: 15),
                        ),
                        TextButton(
                            onPressed: () {
                              showModalBottomSheet(
                                  backgroundColor: Colors.white.withOpacity(0),
                                  context: context,
                                  builder: (BuildContext context) {
                                    return LabelAdder();
                                  });
                            },
                            child: Text(
                              '+ Add Label',
                              style: kSubTitleStyle.copyWith(fontSize: 16),
                            ))
                      ],
                    )),
                Container(
                  width: 600,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xff3d3b3b)),
                  child: LabelList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}