import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:future_me/components/bored_activities/with_friends.dart';
import 'package:future_me/components/shared/colors.dart';
import 'package:future_me/model/QuotesModel.dart';
import 'package:future_me/services/quotes.dart';
import 'package:future_me/views/login_view.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //todo: if the new task is true on load it should show that new task has been added with the showSuccessModel
  }

  @override
  Widget build(BuildContext context) {
    final AsyncValue<Quotes> getQuotes = ref.watch(getQuote);

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: redColor,
        leading: Icon(Icons.person,color: Colors.white,),
        title: Text(
          "Welcome, ${ref.read(userDetails.notifier).state.displayName}",
          style: GoogleFonts.inter(
            fontWeight: FontWeight.bold,
            fontSize: width * 0.05,
            color: ghostWhite,
          ),
        ),
      ),
      body: Container(
        // padding: EdgeInsets.only(left: 20,right: 20,top: 10),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              margin:  EdgeInsets.only(left: 20,right: 20,top: 10),
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
                    blurRadius: 30,
                  )
                ],
              ),
              child: Column(
                children: [
                  Text(
                    "No goals have been set",
                    style: GoogleFonts.poppins(
                      fontSize: 20.sp,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      context.push("/create");
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 35, vertical: 5),
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
              height: 10,
            ),
            // StreamBuilder<QuerySnapshot>(
            //   stream: fire
            // )
            Container(
              margin:  EdgeInsets.only(left: 20,right: 20,top: 10),
              color: Colors.blue,
              height: 400,
              child: GridView.count(
                crossAxisCount: 2,
                primary: false,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    color: Colors.red,
                    child: const Text("this is the only way to go "),
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    color: Colors.red,
                    child: const Text("this is the only way to go "),
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    color: Colors.red,
                    child: const Text("this is the only way to go "),
                  ),
                ],
              ),
            ),
            //This is the quotes section
            Container(
              margin:  EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
              child: getQuotes.when(data: (data) {
                return Container(
                  padding: EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width,
                  height: 200,
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
                        blurRadius: 30,
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data.q.toString(),
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '- ${data.a.toString()}',
                        textAlign: TextAlign.end,
                        style: GoogleFonts.poppins(
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                );
              }, error: (error, _) {
                return Center(
                  child: Text("Believe in You!!!"),
                );
              }, loading: () {
                return Center(
                  child: SpinKitCubeGrid(
                    size: 20,
                    color: Colors.red.withOpacity(0.5),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
