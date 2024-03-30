import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_me/components/shared/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class FriendActivity extends ConsumerStatefulWidget {
  const FriendActivity({Key? key}) : super(key: key);

  @override
  ConsumerState<FriendActivity> createState() => _FriendActivityState();
}

class _FriendActivityState extends ConsumerState<FriendActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "How many friends do you have ?",
              style: GoogleFonts.raleway(
                color: Color(0xff616878),
                fontSize: 18.sp,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: ghostWhite,
              ),
              child: Row(
                children: [
                  Image.asset("assets/images/warning.png"),
                  SizedBox(
                    width: 20,
                  ),
                  Flexible(
                    child: Text(
                      "You are only allowed a limit of 5 friends",
                      style: GoogleFonts.poppins(
                        color: Color(0xff9C9C9C),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 50,
              child: TextField(
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 18.sp,
                ),
                decoration: InputDecoration(

                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 1,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
