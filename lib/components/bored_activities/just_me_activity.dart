import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:future_me/model/BoredApi.dart';
import 'package:future_me/services/bored_api_services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../shared/colors.dart';

class JustMeActivity extends ConsumerStatefulWidget {
  const JustMeActivity({Key? key, required this.participants})
      : super(key: key);

  final int participants;

  @override
  ConsumerState<JustMeActivity> createState() => _JustMeActivityState();
}

class _JustMeActivityState extends ConsumerState<JustMeActivity> {
  @override
  Widget build(BuildContext context) {
    final AsyncValue<BoredApi?> task = ref.watch(getSingleActivity(1));

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "This is your fun task",
                style: GoogleFonts.raleway(
                  color: Color(0xff616878),
                  fontSize: 16.sp,
                ),
              ),
              task.when(data: (data) {
                if (data != null) {
                  return Text(
                    data.activity!,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 28.sp,
                    ),
                  );
                } else {
                  return Text(
                    "Unable to get activity",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                    ),
                  );
                }
              }, error: (error, _) {
                return Container(
                  child: Center(
                    child: Text("Unable to fetch now"),
                  ),
                );
              }, loading: () {
                return SpinKitChasingDots(
                  size: 20,
                  color: Colors.grey,
                );
              }),
              InkWell(
                onTap: () {
                  ref.refresh(getSingleActivity(1));
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 35),
                  decoration: BoxDecoration(
                    color: brightRed.withOpacity(0.3),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        offset: Offset(0, 6),
                        blurRadius: 5,
                      )
                    ],
                  ),
                  child: Text(
                    "Fetch A New Task",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
