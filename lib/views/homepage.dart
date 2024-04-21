import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:future_me/components/bored_activities/with_friends.dart';
import 'package:future_me/components/shared/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //todo: if the new task is true on load it should show that new task has been added with the showSuccessModel
  }
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



