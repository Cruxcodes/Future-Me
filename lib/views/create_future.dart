import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:future_me/components/bored_activities/with_friends.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../components/btn.dart';

class CreateFuture extends StatefulWidget {
  const CreateFuture({Key? key}) : super(key: key);

  @override
  State<CreateFuture> createState() => _CreateFutureState();
}

class _CreateFutureState extends State<CreateFuture> {
  TextEditingController futureWant = TextEditingController();
  TextEditingController timeFrame = TextEditingController();
  TextEditingController taskCount = TextEditingController();
  final key = GlobalKey<FormState>();
  late FocusNode futureWantNode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureWantNode = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    futureWantNode.dispose();
  }

  handleSubmit() {
    if (futureWant.text.isEmpty || taskCount.text.isEmpty) {
      showErrorDialog(context, "Please input all the required fields");
    } else {
      //This is where you run the chatGpt code
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        // child: Container(
        //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        //   decoration: BoxDecoration(
        //     color: Colors.white,
        //   ),
        //   child: Center(
        //     child: Form(
        //       key: key,
        //       child: SingleChildScrollView(
        //         child: Center(
        //           child: Column(
        //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //             children: [
        //               InputAndLabel(
        //                   controller: futureWant,
        //                   labelText:
        //                       "Hello, what is the goal you  want to achieve?",
        //                   prefixText: "I want to "),
        //               SizedBox(
        //                 height: 20,
        //               ),
        //               InputAndLabel(
        //                   controller: timeFrame,
        //                   labelText: "How long do you plan to pursue this?",
        //                   prefixText: "For "),
        //               SizedBox(
        //                 height: 20,
        //               ),
        //
        //               InputAndLabel(
        //                   controller: taskCount,
        //                   labelText: "How many tasks can you do a day",
        //                   prefixText: "I can do "),
        //               SizedBox(
        //                 height: 30,
        //               ),
        //               InkWell(onTap: handleSubmit, child: BTN(text: "Next")),
        //             ],
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            height: 450,
            // width: 200,
            child: SfDateRangePicker(
              onSubmit: (value) {
                if (value != null) {
                  final nowDate = DateTime.now();
                  final endDate = value as DateTime;
                  final differenceInValue = endDate.difference(nowDate).inDays +
                      1; //Add one so the last date is selected
                }
                //This returns date
              },
              headerStyle: DateRangePickerHeaderStyle(
                  textStyle: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center),
              // backgroundColor: Colors.red,
              onCancel: () {
                context.pop();
              },
              showActionButtons: true,
              view: DateRangePickerView.month,
              // initialDisplayDate: DateTime.now(),
            ),
          ),
        ),
      ),
    );
  }
}

class InputAndLabel extends StatelessWidget {
  const InputAndLabel(
      {super.key,
      required this.controller,
      required this.labelText,
      required this.prefixText});

  final TextEditingController controller;
  final String labelText;
  final String prefixText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      child: Column(
        children: [
          Text(
            labelText,
            textAlign: TextAlign.center,
            style:
                GoogleFonts.poppins(fontSize: 18.sp, color: Color(0xff5B5B5B)),
          ),
          SizedBox(
            height: 15,
          ),
          TextField(
            cursorColor: Colors.black12,
            cursorWidth: 1,
            cursorOpacityAnimates: true,
            style: GoogleFonts.poppins(
              fontSize: 18.sp,
            ),
            // focusNode: futureWantNode,
            controller: controller,
            decoration: InputDecoration(
              prefixText: prefixText,
              prefixStyle: GoogleFonts.poppins(
                  color: Color(0xff7F7F7F),
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500),
              contentPadding: EdgeInsets.all(6),
              border: OutlineInputBorder(),
              focusColor: Colors.black,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
