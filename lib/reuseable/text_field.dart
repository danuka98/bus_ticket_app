import 'package:csse/styles/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldRounded extends StatelessWidget {

  final String placeHolder;

  const TextFieldRounded({
    required this.placeHolder,
  });

  @override
  Widget build(BuildContext context) {
    double widthScale = MediaQuery.of(context).size.width / 207;
    double heightScale = MediaQuery.of(context).size.height / 448;

    return Padding(
      padding: EdgeInsets.only(
        left: widthScale * 20,
        right: widthScale * 20,
        bottom: heightScale * 10,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 1,color: kDarkBlue.withOpacity(0.4),),
        ),
        child: Padding(
          padding: EdgeInsets.only(
              left: widthScale *10
          ),
          child: TextField(
            style: TextStyle(color: kDarkBlue),
            decoration: InputDecoration(
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: placeHolder,
              hintStyle: GoogleFonts.roboto(
                textStyle: TextStyle(
                  color: kDarkBlue.withOpacity(0.4),
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
