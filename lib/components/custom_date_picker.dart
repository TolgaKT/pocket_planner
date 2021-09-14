import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pocket_planner/components/rounded_button.dart';
import 'package:pocket_planner/constants.dart';

const double _kDayPickerRowHeight = 42.0;
const int _kMaxDayPickerRowCount = 6; // A 31 day month that starts on Saturday.

class _DayPickerGridDelegate extends SliverGridDelegate {
  const _DayPickerGridDelegate();

  @override
  SliverGridLayout getLayout(SliverConstraints constraints) {
    const int columnCount = DateTime.daysPerWeek;
    final double tileWidth = constraints.crossAxisExtent / columnCount;
    final double viewTileHeight =
        constraints.viewportMainAxisExtent / (_kMaxDayPickerRowCount + 1);
    final double tileHeight = math.max(_kDayPickerRowHeight, viewTileHeight);

    return SliverGridRegularTileLayout(
      crossAxisCount: columnCount,
      mainAxisStride: tileHeight,
      crossAxisStride: tileWidth,
      childMainAxisExtent: tileHeight,
      childCrossAxisExtent: tileWidth,
      reverseCrossAxis: axisDirectionIsReversed(constraints.crossAxisDirection),
    );
  }

  @override
  bool shouldRelayout(_DayPickerGridDelegate oldDelegate) => false;
}

class CustomDatePicker extends StatefulWidget {
  @override
  _CustomDatePickerState createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  String dateTitle;
  DateTime date;
  DateTime selectedDate;

  static const List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  static const List<String> days = ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su'];

  static const List<int> _daysInMonth = <int>[
    31,
    -1,
    31,
    30,
    31,
    30,
    31,
    31,
    30,
    31,
    30,
    31,
  ];

  IndexedWidgetBuilder buildDates(int emptyContainers) {
    return (BuildContext context, int index) {
      return ConstrainedBox(
        constraints: BoxConstraints(minWidth: 30, maxWidth: 30),
        child: index < emptyContainers
            ? Container()
            : TextButton(
                style: ButtonStyle(
                    backgroundColor: selectedDate ==
                            DateTime(date.year, date.month,
                                index + 1 - emptyContainers)
                        ? MaterialStateProperty.all(kColorMap['kMainPurple'])
                        : MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)))),
                onPressed: DateTime(DateTime.now().year, DateTime.now().month,
                                DateTime.now().day)
                            .compareTo(DateTime(date.year, date.month,
                                index + 1 - emptyContainers)) <=
                        0
                    ? () {
                        setState(() {
                          selectedDate = DateTime(date.year, date.month,
                              index + 1 - emptyContainers);
                        });
                      }
                    : null,
                child: Text(
                  '${index + 1 - emptyContainers}',
                  style: DateTime(DateTime.now().year, DateTime.now().month,
                                  DateTime.now().day)
                              .compareTo(DateTime(date.year, date.month,
                                  index + 1 - emptyContainers)) <=
                          0
                      ? TextStyle(color: Colors.black)
                      : TextStyle(color: Colors.grey),
                ),
              ),
      );
    };
  }

  int getDaysInMonth(int year, int month) {
    if (month == DateTime.february) {
      final bool isLeapYear =
          (year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0);
      if (isLeapYear) return 29;
      return 28;
    }
    return _daysInMonth[month - 1];
  }

  int calculateEmptyContainers() {
    return (DateTime(date.year, date.month, 1).weekday) - 1;
  }

  void changeMonth(bool add) {
    if (add) {
      setState(() {
        date = DateTime(date.year, date.month + 1, date.day);
        dateTitle = '${months[date.month - 1]}, ${date.year}';
      });
    } else {
      setState(() {
        date = DateTime(date.year, date.month - 1, date.day);
        dateTitle = '${months[date.month - 1]}, ${date.year}';
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      date = DateTime.now();
      selectedDate = DateTime(date.year, date.month, date.day);
      dateTitle = '${months[date.month - 1]}, ${date.year}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: 550,
          width: 400,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RoundedButton(
                      buttonColor: Colors.white,
                      buttonChild: Icon(
                        Icons.arrow_back_ios_outlined,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        changeMonth(false);
                      },
                    ),
                    SizedBox(
                      width: 65,
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(minWidth: 140, maxWidth: 140),
                      child: Center(
                        child: Text(
                          dateTitle,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 65,
                    ),
                    RoundedButton(
                      buttonColor: Colors.white,
                      buttonChild: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        changeMonth(true);
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: days
                      .map((e) => ConstrainedBox(
                            constraints:
                                BoxConstraints(minWidth: 25, maxWidth: 25),
                            child: Center(
                              child: Text(
                                e,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ))
                      .toList()),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: _DayPickerGridDelegate(),
                      itemCount: getDaysInMonth(date.year, date.month) +
                          calculateEmptyContainers(),
                      itemBuilder: buildDates(calculateEmptyContainers())),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RoundedButton(
                      buttonColor: Colors.grey,
                      onPressed: () {
                        Navigator.pop(context, null);
                      },
                      buttonChild: Text('Cancel'),
                      height: 50,
                      width: 140,
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    RoundedButton(
                      buttonColor: Colors.blueAccent,
                      onPressed: () {
                        Navigator.pop(context, selectedDate);
                      },
                      buttonChild: Text('Okay'),
                      height: 50,
                      width: 140,
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
