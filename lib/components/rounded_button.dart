import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Color buttonColor;
  final Widget buttonChild;
  final Function onPressed;
  final double height;
  final double width;

  RoundedButton(
      {this.buttonChild,
      this.buttonColor,
      this.onPressed,
      this.width = 50,
      this.height = 50});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 20,
            primary: buttonColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18))),
        onPressed: onPressed,
        child: Center(child: buttonChild),
      ),
    );
  }
}
