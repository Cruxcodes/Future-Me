import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:future_me/views/bored_page.dart';
import 'package:future_me/views/goals_page.dart';
import '../components/bottom_navigation.dart';
import 'homepage.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  // bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
  //   print("BACK BUTTONfsafdsafds!"); // Do some stuff.
  //   if (info.ifRouteChanged(context)) return false;
  //   return true;
  // }
  //
  // @override
  // void initState() {
  //   super.initState();
  //   BackButtonInterceptor.add(myInterceptor);
  // }
  //
  // @override
  // void dispose() {
  //   BackButtonInterceptor.remove(myInterceptor);
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    // return BottomNavigationLayout(
    //   pages: [
    //     // Define your pages here
    //     HomePage(),
    //     CurrentLocation(),
    //     FlippingPage(),
    //     Promotions(),
    //     Chat(),
    //   ],
    // );
    return WillPopScope(
        onWillPop: () async {
          // Handle the back button press here
          return _onBackButtonPressed(context);
        },
        child: BottomNavigationLayout(
          pages: [
            // Define your pages here
            HomePage(),
            Goals(),
            BoredPage(),
          ],
        ));
  }

  // _onBackButtonPressed(BuildContext context) async {
  Future<bool> _onBackButtonPressed(BuildContext context) async {
    bool? confirmLogout = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text("Are you sure you want to exit the application?"),
        content: Text("Do you really want to exit?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true); // Return true for 'Yes' button
            },
            child: const Text(
              "Yes",
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false); // Return false for 'No' button
            },
            child: const Text(
              "No",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
      barrierDismissible: true,
    );

    return confirmLogout ??
        false; // Handle the case when the dialog is dismissed
  }
}
