import 'dart:convert';

import 'package:expense_manager/auth/homepqge.dart';
import 'package:expense_manager/auth/screens/dashboardlist.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../auth/login.dart';
import '../utilities/sharedPrefrence.dart';


class AppDrawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() =>  _State();
}
class _State extends State<AppDrawer> {
  final _auth = FirebaseAuth.instance;

  String firstLetter="", userName="", emailId="";

  bool showSpinner = false;

  blankMethod() {}
  @override
  void initState() {
    super.initState();
    inputData();
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            accountName: new Text(userName),
            accountEmail: new Text(emailId),
            currentAccountPicture: CircleAvatar(
              child: Icon(Icons.person),
                backgroundColor: Colors.white,
                ),

          ),

          _createDrawerItem(icon: Icons.home, text: 'Home', onTap: _homeNavigation),
          Divider(),
          _createDrawerItem(
              icon: Icons.category, text: 'Category', onTap: blankMethod),

          Divider(),
          _createDrawerItem(
              icon: Icons.person, text: 'Profile', onTap: blankMethod),
          Divider(),
          _createLogoutItem(
              icon: Icons.exit_to_app, text: 'Logout', onTap: _performLogout),
        ],
      ),
    );
  }
  Widget _createLogoutItem(
      {required IconData icon, required String text, required GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: _performLogout,
    );
  }
  Future<void> inputData() async {
    final User? user = _auth.currentUser;
setState(() async {
  userName = (await SharedPrefUtil.getUsrname("username"))!;

});
      print("username"+userName);

  }
  Widget _createDrawerItem(
      {required IconData icon, required String text, required GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: blankMethod,
    );
  }
  _homeNavigation() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => Dashboardlist()));
  }
  _performLogout() async {
    _auth.signOut();
    SharedPrefUtil.setLoginStatus("LOGIN_STATUS", false);

    Navigator.pop(context);
    Navigator.push(
        context, MaterialPageRoute(builder: (BuildContext context) => Login()));

  }

}
