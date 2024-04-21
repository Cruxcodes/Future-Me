import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:future_me/components/shared/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: redColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Welcome, Trial",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: width * 0.05,
            color: ghostWhite,
          ),
        ),
      ),
      body: Container(
        child: Text("test"),
      ),
    );
  }
}



