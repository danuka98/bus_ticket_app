import 'package:csse/styles/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late double widthScale, heightScale, width, height;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    widthScale = MediaQuery.of(context).size.width / 207;
    heightScale = MediaQuery.of(context).size.height / 448;

    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kWhite,
        leading:  Icon(Icons.menu,color: kDarkBlue,),
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: widthScale * 10
            ),
            child: Icon(Icons.notifications_none,color: kDarkBlue,),
          ),
        ],
      ),
      body: SafeArea(
        child: HomePageDetails(),
      ),
    );
  }

  Widget HomePageDetails(){
    return Padding(
      padding: EdgeInsets.only(
        left: widthScale * 10,
        right: widthScale * 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Welcome, User',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w600,
                color: kDarkBlue,
              )
            ),
          ),
          Container(
            width: width,
            height: heightScale * 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: kDarkBlue,
            ),
            child: Padding(
              padding: EdgeInsets.only(
                left: widthScale * 10,
                top: heightScale * 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Today is'),
                  Row(
                    children: [
                      Text('2021/10/01'),
                      Text('21:15'),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
