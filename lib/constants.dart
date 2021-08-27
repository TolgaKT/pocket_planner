import 'package:flutter/material.dart';

const kColorMap = {
  'kMainPink': Color(0xffeb4090),
  'kDarkPink': Color(0xffc82863),
  'kLightPink': Color(0xffF5DEDB),
  'kLightOrange': Color(0xffeb8d35),
  'kDarkOrange': Color(0xffeb6035),
  'kMainYellow': Color(0xfff0ab3c),
  'kLightBlue': Color(0xff55bff0),
  'kUltraLightBlue': Color(0xff7acbf0),
  'kMainBlue': Color(0xff327af5),
  'kDarkBlue': Color(0xff28287d),
  'kAltDarkBlue': Color(0xff32418c),
  'kMainWhite': Color(0xffffffff),
  'kMainPurple': Color(0xff9c6eeb),
  'kDarkPurple': Color(0xff6464d2),
  'kGrey': Color(0xff5a6487),
  'kMainCyan': Color(0xff5ac8bf),
  'kDarkCyan': Color(0xff50b48c),
  'kMainRed': Color(0xffBA0C14),
  'kBackgroundColor': Color(0xff292929)
};

const kLabelMap = {
  'kMainPink': Color(0xffeb4090),
  'kDarkPink': Color(0xffc82863),
  'kLightPink': Color(0xffF5DEDB),
  'kLightOrange': Color(0xffeb8d35),
  'kDarkOrange': Color(0xffeb6035),
  'kMainYellow': Color(0xfff0ab3c),
  'kLightBlue': Color(0xff55bff0),
  'kUltraLightBlue': Color(0xff7acbf0),
  'kMainBlue': Color(0xff327af5),
  'kDarkBlue': Color(0xff28287d),
  'kAltDarkBlue': Color(0xff32418c),
  'kMainPurple': Color(0xff9c6eeb),
  'kDarkPurple': Color(0xff6464d2),
  'kMainCyan': Color(0xff5ac8bf),
  'kDarkCyan': Color(0xff50b48c),
  'kMainRed': Color(0xffBA0C14),
  'kBackgroundColor': Color(0xff292929)
};

const kTitleStyle = TextStyle(
    color: Colors.white, fontFamily: 'OpenSans', fontWeight: FontWeight.w700);

const kSubTitleStyle = TextStyle(
    color: Colors.white,
    fontFamily: 'OpenSans',
    fontWeight: FontWeight.w400,
    fontSize: 14);

const kTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: '+',
  border: InputBorder.none,
  hintStyle: TextStyle(fontSize: 16.0, color: Colors.white),
);
