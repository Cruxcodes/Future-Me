import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:future_me/components/bored_activities/with_friends.dart';
import 'package:future_me/components/shared/colors.dart';
import 'package:future_me/services/ai_api_call.dart';
import 'package:future_me/services/firestore.dart';
import 'package:future_me/views/create_future.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/btn.dart';
import 'login_view.dart';

class ChatResponse extends ConsumerStatefulWidget {
  const ChatResponse({Key? key}) : super(key: key);

  @override
  ConsumerState<ChatResponse> createState() => _ChatResponseState();
}

class _ChatResponseState extends ConsumerState<ChatResponse> {
  final FirestoreService firestoreService = FirestoreService();

  bool isLoading = true;
  List<String> taskList = [];
  Goal goal = Goal();
  bool isAddingToDatabse = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserTasks();
  }

  @override
  void dispose() {
    super.dispose();
    taskList = [];
  }

  getUserTasks() async {
    final futureModel = ref.read(futureModelProvider.notifier).state;
    var response = await fetchTasks(
        futureWant: futureModel.futureWant!,
        taskCount: futureModel.taskCount!,
        timeFrame: futureModel.timeSpan!);
    final getTimeInNumbers = futureModel.timeSpan?.split(" ");
    // log();
    if (response != null && response.choices!.length > 0) {
      setState(() {
        isLoading = false;
        taskList = response.choices![0].message!.content!
            .replaceAll("[", "")
            .replaceAll("]", "")
            .replaceAll('"', "")
            .split(',')
            .map((task) => task.trim())
            .toList();
      });
    }
  }

  refetchTaskList() async {
    setState(() {
      isLoading = true;
    });
    final futureModel = ref.read(futureModelProvider.notifier).state;
    var response = await fetchNewTasks(
        futureWant: futureModel.futureWant!,
        taskCount: futureModel.taskCount!,
        timeFrame: futureModel.timeSpan!,
        tasks: taskList);
    if (response != null && response.choices!.length > 0) {
      setState(() {
        isLoading = false;
        taskList = response.choices![0].message!.content!
            .replaceAll("[", "")
            .replaceAll("]", "")
            .replaceAll('"', "")
            .split(',')
            .map((task) => task.trim())
            .toList();
      });
    }
  }

  // final goal  = Goal();
  @override
  Widget build(BuildContext context) {
    final userDets = ref.read(userDetails.notifier).state;
    final futureModel = ref.read(futureModelProvider.notifier).state;

    handleAcceptTask() async {
      // futureModelProvider
      final futureModel = ref.read(futureModelProvider.notifier).state;
      // final goal = Goal(futureModel.futureWant,futureModel.);
      // await firestoreService.addGoal(goal);

      print(userDets.uid);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 300,
              decoration: BoxDecoration(
                color: ghostWhite,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: Offset(0, 6),
                    color: Color(0xff000000).withOpacity(0.3),
                  ),
                ],
              ),
              child: isLoading
                  ? SpinKitThreeBounce(
                      size: 20,
                      color: Colors.red,
                    )
                  : Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: ListView.builder(
                        itemCount: taskList.length, // Length of the list
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  (index + 1).toString(),
                                  style: GoogleFonts.poppins(
                                    fontSize: 13.sp,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Flexible(
                                  child: Text(
                                    taskList[index],
                                    style: GoogleFonts.poppins(
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ); // Display each item
                        },
                      ),
                    ),
            ),
            SizedBox(
              height: 40,
            ),
            InkWell(
              onTap:  () async {
                setState(() {
                  isLoading = true;
                  goal.timeSpan = futureModel.timeSpan;
                  goal.goals = taskList;
                  goal.nameOfGoal = futureModel.futureWant;
                });
                dynamic res = await firestoreService.addGoal(
                    goal, ref.watch(userDetails.notifier).state.uid!);
                if (res != null) {
                  ref.invalidate(futureModelProvider);
                  context.go('/actualHome');
                } else {
                  showErrorDialog(
                      context, "Unable to create entry at this moment");
                }
              },
              child: BTN(text: "Accept"),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                refetchTaskList();
              },
              child: BTN(text: "Another task list", greyedOut: true),
            ),
          ],
        ),
      ),
    );
  }
}
