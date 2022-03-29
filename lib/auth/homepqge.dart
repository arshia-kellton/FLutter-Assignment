import 'package:expense_manager/auth/screens/add_bill.dart';
import 'package:expense_manager/auth/screens/dashboardlist.dart';
import 'package:expense_manager/auth/screens/finalreport.dart';
import 'package:expense_manager/auth/screens/mynavigationbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../drawer/AppDrawer.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<Homepage> {
  final _formKey = GlobalKey<FormState>();
  late String _email, _password;
  String _emailResult = "", _passwordResult = "";
  TextEditingController userNameController = TextEditingController();
  int _selectedIndex = 0;
  final List _children = [Dashboardlist(),AddBill(),FinalReport()];

  // final _auth = FirebaseAuth.instance;
  bool showSpinner = false;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));
    return Scaffold(
      backgroundColor: Colors.blue,
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: 'Category'),
            BottomNavigationBarItem(
              icon: Icon(Icons.date_range),
              label: 'Add Bill',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.report),
              label: 'Report',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.brown,
          iconSize: 20,
          onTap: _onItemTapped,
          elevation: 5),
      body: _children[_selectedIndex],
    );
  }

  Widget subjectListView() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
        child: Dashboardlist());
  }
}
