import 'dart:async';
import 'dart:convert';
import 'package:expense_manager/auth/homepqge.dart';
import 'package:expense_manager/auth/login.dart';
import 'package:expense_manager/auth/screens/onbording.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utilities/sharedPrefrence.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  Future<void> navigationPage() async {
    bool? status = await SharedPrefUtil.getLoginStatus("LOGIN_STATUS");
    if (status==true) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => Homepage()));
    } else {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) =>  Onbording()));
    }
  }
  @override
  void initState() {
    super.initState();
    startTime();
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));
    return  Scaffold(
      backgroundColor: Colors.white,
      body:  Center(
          child: Container(

            child:  Image.asset('images/expenses.png'),
          )),
    );
  }
}
