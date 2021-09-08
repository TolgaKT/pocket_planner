import 'package:flutter/material.dart';
import 'package:pocket_planner/constants.dart';

class MenuButton extends StatelessWidget {
  final String buttonText;
  final Icon icon;
  final Color iconBgColor;
  final Function onTap;
  final Color color;

  MenuButton(
      {this.buttonText, this.icon, this.iconBgColor, this.onTap, this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(15)),
        height: 60,
        child: Center(
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 20),
                height: 35,
                width: 35,
                decoration:
                    BoxDecoration(color: iconBgColor, shape: BoxShape.circle),
                child: icon,
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                buttonText,
                style: kSubTitleStyle.copyWith(fontSize: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
