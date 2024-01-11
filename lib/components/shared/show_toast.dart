import 'package:flutter/material.dart';

import 'colors.dart';

class showToast extends StatelessWidget {
  final String msg;

  const showToast({super.key, required this.msg});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;


    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(20),
      width: width * 0.7,
      decoration: BoxDecoration(
          color: redColor, borderRadius: BorderRadius.circular(10)),
      child: Center(
          child: Text(
        msg,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: ghostWhite,
        ),
      )),
    );
  }
}
