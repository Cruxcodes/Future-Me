import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_me/components/shared/colors.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:in_app_notification/in_app_notification.dart';

// import '../../constants/colors.dart';

class FriendActivity extends ConsumerStatefulWidget {
  const FriendActivity({Key? key}) : super(key: key);

  @override
  ConsumerState<FriendActivity> createState() => _FriendActivityState();
}

class _FriendActivityState extends ConsumerState<FriendActivity> {
  final participants = TextEditingController();

  handleSubmit() {
    if (int.parse(participants.value.text) <= 5) {
      context.push("/bored/just_me/${int.parse(participants.value.text)}");
    }else{
      showErrorDialog(context, "errorMessage");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 60, horizontal: 20),
        color: Colors.white,
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
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
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
              width: 65,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff533030).withOpacity(0.5),
                    offset: Offset(0, 4),
                    blurRadius: 10,
                  )
                ],
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: TextField(
                controller: participants,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 18.sp,
                ),
                cursorColor: Color(0xff9C9C9C),
                decoration: InputDecoration(
                  focusColor: Color(0xff9C9C9C),
                  contentPadding: EdgeInsets.all(15),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: handleSubmit,
              // onTap: (){ref.refresh(getSingleActivity);},
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 45),
                decoration: BoxDecoration(
                  color: brightRed,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      offset: Offset(0, 6),
                      blurRadius: 5,
                    )
                  ],
                ),
                child: Text(
                  "Get Activity",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}



void showErrorDialog(BuildContext context, String errorMessage) {
  InAppNotification.show(
    child: Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        child: Center(
          child: Text(
            textAlign: TextAlign.center,
            errorMessage,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          color: Colors.red.withOpacity(0.99),
        ),
      ),
    ),
    context: context,
    duration: Duration(seconds: 2),
    onTap: () => print('Notification tapped!'),
  );
}
