import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(14)),
      child: Center(
        child: IconButton(
          icon: Icon(
            CupertinoIcons.search,
            size: 24,
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
