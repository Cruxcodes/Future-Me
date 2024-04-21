
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:future_me/components/shared/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class BTN extends StatelessWidget {
  const BTN({super.key, required this.text, this.greyedOut = false});

  final String text;
  final bool greyedOut;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 45),
      decoration: BoxDecoration(
        color: greyedOut ? Color(0xff8A8A8A) : brightRed,
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
        text,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }
}
