import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:csse/model/journey.dart';
import 'package:csse/provider/user_provider.dart';
import 'package:csse/screens/home.dart';
import 'package:csse/styles/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:http/http.dart' as http;

class GenerateQr extends StatefulWidget {
  const GenerateQr({Key? key}) : super(key: key);

  @override
  _GenerateQrState createState() => _GenerateQrState();
}

class _GenerateQrState extends State<GenerateQr> {
  late double widthScale, heightScale;
  List<Journey> journey = [];

  //fetch Details from the API CAll
  String url = 'https://blackcode-bus-ticketing-system.herokuapp.com/api/v1/journey/getalljourney';
  Future getPastJourney() async {
    try{
      final response = await http.get(
          Uri.parse(url),
          headers: {
            "Accept" : "application/json",
          }
      );
      Map<String, dynamic> responseBody = json.decode(response.body);
      if(response.statusCode == 200){
        PastJourney journeyDetails = PastJourney.fromJson(responseBody);
        print("======================Works=============================");
        for (int i = 0; i < journeyDetails.journey.length; i++){
          journey.add(journeyDetails.journey[i]);
        }
      }
    } catch(e){
      print("=================throwing Exception error==================");
      print("Error: $e");
      throw Exception("Error on server");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPastJourney();
  }

  @override
  Widget build(BuildContext context) {
    widthScale = MediaQuery.of(context).size.width / 207;
    heightScale = MediaQuery.of(context).size.height / 448;

    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kWhite,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap : (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
          child: Icon(
            Icons.arrow_back_ios_outlined,
            color: kDarkBlue,
          ),
        ),
        title: Text('Generate QR',style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: kDarkBlue,
            )
        ),),
        iconTheme: IconThemeData(color: kDarkBlue),
      ),
      body: generateqrDetails(),
    );
  }

  Widget generateqrDetails(){
    final details = Provider.of<UserProvider>(context,listen:false);

    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
              top: heightScale * 40,
              bottom: heightScale * 50
          ),
          child: Center(
            child: Text(
              'Automatically QR code will generated',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: kDarkBlue,
                ),
              ),
            ),
          ),
        ),
        QrImage(
          data: 'Black Code QR Generator Happy Journey \n\n '
              'UserName : ${details.user.firstName} \n\n '
              'Phone Number : ${details.user.phoneNumber} \n\n '
              'AccountBalance : ${details.user.accountBalance} \n\n '
              'Journey Details : ${journey} \n\n ',
          version: QrVersions.auto,
          size: 320,
          gapless: false,
        ),
      ],
    );
  }
}

