import 'package:flutter/material.dart';

Widget incDecBtn(
    {required bool isInc, required bool isActive, required Function() onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        border:
            Border.all(color: isActive ? Color(0xff1389b3) : Color(0xffc8e3ed)),
        borderRadius: BorderRadius.circular(50),
        color: Colors.white,
      ),
      child: Icon(
        isInc ? Icons.add : Icons.remove,
        color: isActive ? Color(0xff1389b3) : Color(0xffc8e3ed),
      ),
    ),
  );
}
