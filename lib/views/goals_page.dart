import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/shared/colors.dart';
import '../services/firestore.dart';
import 'login_view.dart';

class Goals extends ConsumerStatefulWidget {
  const Goals({Key? key}) : super(key: key);

  @override
  ConsumerState<Goals> createState() => _GoalsState();
}

class _GoalsState extends ConsumerState<Goals> {
  final FirestoreService firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Existing Goals",
                style: GoogleFonts.poppins(
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width,
                // height: 10,
                decoration: BoxDecoration(
                  color: ghostWhite,
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
                child: Column(
                  children: [
                    Text(
                      "Create a new goal",
                      style: GoogleFonts.poppins(
                        fontSize: 20.sp,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        context.go("/create");
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 35, vertical: 5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                offset: Offset(0, 4),
                                blurRadius: 10,
                              ),
                            ]),
                        child: Icon(
                          Icons.add_circle_outline_outlined,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              StreamBuilder(
                stream: firestoreService.getTasksStream(ref.watch(userDetails.notifier).state.uid!),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List goalList = snapshot.data!.docs;

                    return Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          // Adjust this value according to your design
                          crossAxisSpacing: 15.0,
                          mainAxisSpacing: 15.0,
                        ),
                        itemCount: goalList.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot docSnap = goalList[index];
                          String docID = docSnap.id;

                          // Get the name from each entry
                          Map<String, dynamic> data =
                              docSnap.data() as Map<String, dynamic>;
                          String goalTitle = data["task_title"];
                          return InkWell(
                            onTap: () {
                              context.push("/single_task/${data["task_id"]}");
                            },
                            child: Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0, 2),
                                      color: Colors.black.withOpacity(0.5),
                                      // spreadRadius: ,
                                      blurRadius: 10,
                                    )
                                  ],
                                  color: lightOrange,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Center(
                                child: Text(
                                  goalTitle,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.raleway(
                                    fontSize: 18.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return Text("no data");
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
