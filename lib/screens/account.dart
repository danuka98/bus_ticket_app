import 'package:csse/provider/user_provider.dart';
import 'package:csse/reuseable/container_card.dart';
import 'package:csse/screens/my_booking.dart';
import 'package:csse/screens/recharge.dart';
import 'package:csse/styles/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'home.dart';

class UserAccount extends StatefulWidget {
  const UserAccount({Key? key}) : super(key: key);

  @override
  _UserAccountState createState() => _UserAccountState();
}

class _UserAccountState extends State<UserAccount> {
  late double widthScale, heightScale;

  @override
  Widget build(BuildContext context) {
    widthScale = MediaQuery.of(context).size.width / 207;
    heightScale = MediaQuery.of(context).size.height / 448;

    return Scaffold(
      backgroundColor: kDarkBlue,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kDarkBlue,
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
            color: kWhite,
          ),
        ),
        title: Text('Account',style: GoogleFonts.dmSans(
            textStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: kWhite,
            )
        ),),
        iconTheme: IconThemeData(color: kWhite),
      ),
      body: accountDetails(),
    );
  }

  Widget accountDetails(){
    final details = Provider.of<UserProvider>(context,listen:false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            top: heightScale * 30,
          ),
          child: const CircleAvatar(
            backgroundImage: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
            radius: 40,
          ),
        ),
        Text(
          details.user.firstName! + " " + details.user.lastName.toString(),
          style: GoogleFonts.roboto(
            textStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: kWhite,
            ),
          ),
        ),
        Text(
          details.user.email.toString(),
          style: GoogleFonts.roboto(
            textStyle: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: kWhite,
            ),
          ),
        ),
        Text(
          details.user.phoneNumber.toString(),
          style: GoogleFonts.roboto(
            textStyle: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: kWhite,
            ),
          ),
        ),
        Text(
          '#'+ details.user.id.toString().substring(0,10),
          style: GoogleFonts.roboto(
            textStyle: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: kWhite,
            ),
          ),
        ),
        GestureDetector(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Recharge()),
            );
          },
          child: Padding(
            padding: EdgeInsets.only(
              top: heightScale * 40,
              bottom: heightScale * 10,
            ),
            child: ContainerWithText(
                icon: Icon(Icons.receipt,color: kDarkBlue,),
                text: 'Recharge'
            ),
          ),
        ),
        GestureDetector(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyBooking()),
            );
          },
          child: Padding(
            padding: EdgeInsets.only(
              bottom: heightScale * 10,
            ),
            child: ContainerWithText(
                icon: Icon(Icons.history_edu,color: kDarkBlue,),
                text: 'History'
            ),
          ),
        ),
        GestureDetector(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
          child: Padding(
            padding: EdgeInsets.only(
              bottom: heightScale * 10,
            ),
            child: ContainerWithText(
                icon: Icon(Icons.account_balance,color: kDarkBlue,),
                text: 'Account Balance'
            ),
          ),
        ),
        GestureDetector(
          onTap: (){
            Navigator.pushReplacementNamed(context, '/login');
          },
          child: Padding(
            padding: EdgeInsets.only(
              bottom: heightScale * 10,
            ),
            child: ContainerWithText(
                icon: Icon(Icons.logout,color: kDarkBlue,),
                text: 'Log Out'
            ),
          ),
        ),
      ],
    );
  }
}
