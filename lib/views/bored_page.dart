import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:future_me/services/bored_api_services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BoredPage extends StatefulWidget {
  const BoredPage({Key? key}) : super(key: key);

  @override
  State<BoredPage> createState() => _BoredPageState();
}

class _BoredPageState extends State<BoredPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getBoredActivity();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Select Type Of Activity",
                style: GoogleFonts.raleway(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ActivityType(
                activityType: "Just For Me",
                activityTap: () {
                  context.push("/bored/just_me");
                },
              ),
              SizedBox(
                height: 40,
              ),
              ActivityType(
                activityType: "With Friends",
                activityTap: () {
                  context.push("/bored/with_friends");
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ActivityType extends StatefulWidget {
  const ActivityType({
    Key? key,
    required this.activityType,
    required this.activityTap,
  }) : super(key: key);

  final String activityType;
  final Function() activityTap;

  @override
  _ActivityTypeState createState() => _ActivityTypeState();
}

class _ActivityTypeState extends State<ActivityType> {
  Color _buttonColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _buttonColor = Color(0xffF46565).withOpacity(0.5);
        });
      },
      onTapUp: (_) {
        setState(() {
          _buttonColor = Colors.white;
        });
        // widget.activityTap();
        widget.activityTap();
      },
      onTapCancel: () {
        setState(() {
          _buttonColor = Colors.white;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 50),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: _buttonColor,
          border: Border.all(
            width: 1,
            color: Color(0xffF46565),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              offset: Offset(1, 5),
              blurRadius: 5,
            )
          ],
        ),
        child: Text(
          widget.activityType,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
