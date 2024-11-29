import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/btn.dart';
import '../components/shared/colors.dart';
import '../services/firestore.dart';

class FirebaseTask extends StatefulWidget {
  const FirebaseTask({Key? key, required this.taskId}) : super(key: key);

  final String taskId;

  @override
  State<FirebaseTask> createState() => _FirebaseTaskState();
}

class _FirebaseTaskState extends State<FirebaseTask> {
  final FirestoreService firestoreService = FirestoreService();
  List<dynamic> taskList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void handleDayDoneClick() async {
    // Get current "days_done" value (optional)
  }

  @override
  Widget build(BuildContext context) {
    Goal goal = new Goal();
    int daysDone = 0;

    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 10),
      color: ghostWhite,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          backgroundColor: ghostWhite,
          body: StreamBuilder(
            stream: firestoreService.getGoalStream(widget.taskId),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                dynamic documents = snapshot.data!.docs; // List of documents
                if (documents.isNotEmpty) {
                  // Access and display documents here
                  for (var doc in documents) {
                    final String docID = doc.id;
                    final Map<String, dynamic> data =
                        doc.data() as Map<String, dynamic>;
                    taskList = data["task_list"];
                    daysDone = data["days_done"];
                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data["task_title"].toString().toUpperCase(),
                            style: GoogleFonts.raleway(
                                fontSize: 24.sp, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            height: 400,
                            decoration: BoxDecoration(
                              color: lightOrange,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 2),
                                  color: Colors.black.withOpacity(0.5),
                                  // spreadRadius: ,
                                  blurRadius: 10,
                                )
                              ],
                            ),
                            child: ListView.builder(
                              itemCount: taskList.length, // Length of the list
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          taskList[index],
                                          style: GoogleFonts.poppins(
                                            fontSize: 16.sp,
                                            color: ghostWhite,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ); // Display each item
                              },
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          RichText(
                            text: TextSpan(
                              text: "Days Done   ",
                              style: GoogleFonts.raleway(
                                  color: Colors.black, fontSize: 15.sp),
                              children: [
                                TextSpan(
                                  text: data["days_done"].toString(),
                                  style: GoogleFonts.poppins(
                                    fontSize: 20.sp,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // InkWell(
                              //   onTap: () {
                              //     // refetchTaskList();
                              //     print("fdasfa");
                              //   },
                              //   child:
                              //       BTN(text: "Delete Task", greyedOut: true),
                              // ),
                              SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                  onTap: () async {
                                    firestoreService.goals
                                        .doc(docID)
                                        .update({'days_done':daysDone + 1 })
                                        .then((value) => context.go(
                                      '/actualHome'
                                    ))
                                        .catchError((error) => print(
                                            "Failed to update user: $error"));
                                  },
                                  child: BTN(text: "Next")),
                            ],
                          )
                        ],
                      ),
                    );
                  }
                }
                return Text("no data");
              } else {
                // Handle no do`                                                              ````                                                                                                              `cuments found
                return Center(
                  child: Text(
                    "No data found for this task ID.",
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
