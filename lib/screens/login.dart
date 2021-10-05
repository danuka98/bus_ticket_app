import 'package:csse/reuseable/text_field.dart';
import 'package:csse/screens/home.dart';
import 'package:csse/screens/register.dart';
import 'package:csse/styles/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late double widthScale, heightScale, width, height;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(child: LoginBody()),
      ),
    );
  }

  Widget LoginBody(){
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    widthScale = MediaQuery.of(context).size.width / 207;
    heightScale = MediaQuery.of(context).size.height / 448;

    return Padding(
      padding: EdgeInsets.only(
        top: widthScale * 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Log In',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: kDarkBlue,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(
                top: heightScale * 15,
              ),
              child: Image.asset('assets/images/login.jpg',width: widthScale * 100, height: heightScale * 100,),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: widthScale * 30,
            ),
            child: const TextFieldRounded(placeHolder: "Email Address"),
          ),
          const TextFieldRounded(placeHolder: "Password"),
          Padding(
            padding: EdgeInsets.only(
              left: widthScale * 20,
              right: widthScale * 20,
              top: widthScale * 30,
              bottom: widthScale * 20
            ),
            child: GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              child: Container(
                width: width,
                height: heightScale * 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: kDarkBlue,
                ),
                child: Center(
                  child: Text(
                    'Log In',
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
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Register()),
              );
            },
            child: Text(
              "Don't have an account",
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
      ),
    );
  }
}



