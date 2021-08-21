import 'package:flutter/material.dart';
import 'package:pocket_planner/constants.dart';

class MenuButton extends StatelessWidget {
  final String buttonText;
  final Icon icon;
  final Color iconBgColor;
  final Function onTap;

  MenuButton({this.buttonText, this.icon, this.iconBgColor, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
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
