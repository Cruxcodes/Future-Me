import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:future_me/services/bored_api_services.dart';
import 'package:google_fonts/google_fonts.dart';

class BoredPage extends StatefulWidget {
  const BoredPage({Key? key}) : super(key: key);

  @override
  State<BoredPage> createState() => _BoredPageState();
}

class _BoredPageState extends State<BoredPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getBoredActivity();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Select Type Of Activity",
                style: GoogleFonts.raleway(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    border: Border.all(
                      width: 1,
                      color: Colors.orange,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Text(
                    "Just For Me",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
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
