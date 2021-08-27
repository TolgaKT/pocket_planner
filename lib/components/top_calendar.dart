import 'package:flutter/material.dart';
import 'package:pocket_planner/constants.dart';

class TopCalendar extends StatefulWidget {
  final ValueChanged<DateTime> parentAction;

  TopCalendar({this.parentAction});

  @override
  _TopCalendarState createState() => _TopCalendarState();
}

class _TopCalendarState extends State<TopCalendar> {
  int weekDay = DateTime.now().weekday;
  DateTime date = DateTime.now();
  Map<String, DateTime> days = {
    'Mon': null,
    'Tue': null,
    'Wed': null,
    'Thu': null,
    'Fri': null,
    'Sat': null,
    'Sun': null
  };

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

  void adjustDateCard() {
    int i = 1;
    for (var k in days.keys) {
      setState(() {
        //iterate through keys of the map 'days'
        //assign values of the keys as i(1 for monday, 2 for tuesday...) - today's number in week
        //in case user wants to see previous or future weeks
        days[k] = date.add(Duration(days: i - weekDay));
        i++;
      });
    }
  }

  DateTime selectDay(int day, int month, int year) {
    setState(() {
      date = DateTime(year, month, day);
    });
    return date;
  }

  @override
  void initState() {
    super.initState();
    adjustDateCard();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              child: Icon(Icons.arrow_back_ios),
              style: TextButton.styleFrom(primary: Colors.black),
              onPressed: () {
                setState(() {
                  date = date.subtract(Duration(days: 7));
                  adjustDateCard();
                  widget.parentAction(date);
                });
              },
            ),
            Text(
              '${months[date.month - 1]}, ${date.year}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextButton(
              child: Icon(Icons.arrow_forward_ios),
              style: TextButton.styleFrom(primary: Colors.black),
              onPressed: () {
                setState(() {
                  date = date.add(Duration(days: 7));
                  adjustDateCard();
                  widget.parentAction(date);
                });
              },
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: days.entries
              .map((e) => Expanded(
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor:
                              days.values.toList()[weekDay - 1].day ==
                                      e.value.day
                                  ? MaterialStateProperty.all(Colors.blueAccent)
                                  : MaterialStateProperty.all(Colors.white),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)))),
                      onPressed: () {
                        DateTime selectedDate =
                            selectDay(e.value.day, e.value.month, e.value.year);
                        widget.parentAction(selectedDate);
                        setState(() {
                          date = selectedDate;
                          weekDay = selectDay(
                                  e.value.day, e.value.month, e.value.year)
                              .weekday;
                        });
                      },
                      child: Column(
                        children: [
                          Text(
                            '${e.key}',
                            style: kSubTitleStyle.copyWith(
                                color: days.values.toList()[weekDay - 1].day ==
                                        e.value.day
                                    ? Colors.white
                                    : Colors.black),
                          ),
                          Text(
                            '${e.value.day}',
                            style: kSubTitleStyle.copyWith(
                                color: days.values.toList()[weekDay - 1].day ==
                                        e.value.day
                                    ? Colors.white
                                    : Colors.black),
                          )
                        ],
                      ),
                    ),
                  ))
              .toList(),
        ),
      ],
    ));
  }
}
