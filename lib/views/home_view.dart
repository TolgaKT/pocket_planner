import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pocket_planner/constants.dart';
import 'package:pocket_planner/views/add_task_screen.dart';
import 'package:pocket_planner/views/calendar_screen.dart';
import 'package:pocket_planner/views/home_screen.dart';
import 'package:pocket_planner/views/projects_screen.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;
  List<Widget> _views = [
    HomeScreen(),
    CalendarScreen(),
    Container(),
    ProjectsScreen(),
    Container()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _views.elementAt(_selectedIndex),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: kColorMap['kMainPurple'],
          unselectedItemColor: kColorMap['kGrey'],
          selectedFontSize: 12,
          showUnselectedLabels: true,
          currentIndex: _selectedIndex,
          onTap: (int index) {
            if (index != 2) {
              setState(() {
                _selectedIndex = index;
              });
            } else {
              showModalBottomSheet(
                  isScrollControlled: true,
                  useRootNavigator: true,
                  context: context,
                  builder: (context) {
                    return AddTaskScreen();
                  });
            }
          },
          items: [
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.calendar), label: 'Calendar'),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.plus), label: 'Add'),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.book), label: 'Projects'),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.chartLine), label: 'Statistics'),
          ],
        ),
      ),
    );
  }
}
