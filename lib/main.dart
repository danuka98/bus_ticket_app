import 'package:csse/provider/auth_provider.dart';
import 'package:csse/provider/user_provider.dart';
import 'package:csse/screens/get_startted.dart';
import 'package:csse/screens/home.dart';
import 'package:csse/screens/login.dart';
import 'package:csse/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          body: SafeArea(
            child: GetStarted(),
          ),
        ),
        routes: {
          '/login': (context) => Login(),
          '/register': (context) => Register(),
          '/home' : (context) => HomePage(),
        },
      ),
    );
  }
}
