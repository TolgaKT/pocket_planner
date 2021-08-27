import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode node;

  CustomTextField({@required this.node, @required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black)),
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
          border: InputBorder.none,
          hintStyle: TextStyle(fontSize: 16.0, color: Colors.white),
        ),
        controller: controller,
        focusNode: node,
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
