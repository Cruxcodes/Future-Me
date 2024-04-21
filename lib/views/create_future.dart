import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:future_me/components/bored_activities/with_friends.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../components/btn.dart';

class FutureModel {
  String? futureWant;
  String? timeSpan;
  String? taskCount;

  FutureModel({this.futureWant, this.timeSpan, this.taskCount});
}

final futureModelProvider = StateProvider((ref) => FutureModel());

class CreateFuture extends ConsumerStatefulWidget {
  const CreateFuture({Key? key}) : super(key: key);

  @override
  ConsumerState<CreateFuture> createState() => _CreateFutureState();
}

class _CreateFutureState extends ConsumerState<CreateFuture> {
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
    if (ref.read(futureModelProvider.notifier).state.timeSpan != null) {}
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    futureWantNode.dispose();
  }

  handleSubmit() {
    if (futureWant.text.isEmpty || taskCount.text.isEmpty) {
      showErrorDialog(
          context, "Please make sure all the required fields are filled");
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
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Center(
            child: Form(
              key: key,
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InputAndLabel(
                          controller: futureWant,
                          labelText:
                              "Hello, what is the goal you  want to achieve?",
                          prefixText: "I want to "),
                      SizedBox(
                        height: 20,
                      ),
                      InputAndLabel(
                          controller: timeFrame,
                          time: true,
                          labelText: "How long do you plan to pursue this?",
                          prefixText: "For "),
                      SizedBox(
                        height: 20,
                      ),
                      InputAndLabel(
                          controller: taskCount,
                          labelText: "How many tasks can you do a day",
                          prefixText: "I can do "),
                      SizedBox(
                        height: 30,
                      ),
                      InkWell(onTap: handleSubmit, child: BTN(text: "Next")),
                    ],
                  ),
                ),
              ),
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
      this.time = false,
      required this.prefixText});

  final TextEditingController controller;
  final String labelText;
  final String prefixText;
  final bool time;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      child: Column(
        children: [
          Text(
            labelText,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 18.sp,
              color: Color(0xff5B5B5B),
            ),
          ),
          time
              ? Text(
                  "Please specify : years, months, days",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.normal,
                    fontSize: 12.sp,
                    color: Colors.black45
                  ),
                )
              : SizedBox.shrink(),
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
