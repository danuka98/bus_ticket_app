import 'package:csse/reuseable/text_field.dart';
import 'package:csse/screens/login.dart';
import 'package:csse/styles/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late double widthScale, heightScale;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(child: RegisterDetails()),
      ),
    );
  }

  Widget RegisterDetails(){
    widthScale = MediaQuery.of(context).size.width / 207;
    heightScale = MediaQuery.of(context).size.height / 448;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            top: widthScale * 10,
          ),
          child: Text(
            'Create an account',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.bold,
                color: kDarkBlue,
              ),
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Text(
          'Create Account And Make Your Journey Easy',
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 16,
              color: kDarkBlue.withOpacity(0.7),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: widthScale * 30
          ),
          child: TextFieldRounded(placeHolder: 'First Name'),
        ),
        TextFieldRounded(placeHolder: 'Last Name'),
        TextFieldRounded(placeHolder: 'Email Address'),
        TextFieldRounded(placeHolder: 'Phone Number'),
        TextFieldRounded(placeHolder: 'Password'),
        Padding(
          padding: EdgeInsets.only(
              left: widthScale * 20,
              right: widthScale * 20,
              top: widthScale * 10,
              bottom: widthScale * 20
          ),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: heightScale * 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: kDarkBlue,
            ),
            child: Center(
              child: Text(
                'Create Account',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: kWhite,
                  ),
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Login()),
            );
          },
          child: Text(
            "Already have an account",
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: kDarkGreen,
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
