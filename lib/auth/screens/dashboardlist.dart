import 'package:expense_manager/auth/screens/add_bill.dart';
import 'package:expense_manager/drawer/AppDrawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dashboardlist extends StatelessWidget {
  late BuildContext context;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      key: _scaffoldKey,
      drawer: AppDrawer(),
      backgroundColor: Colors.blue,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
                top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                /*   IconButton(
                  icon: Icon(Icons.list),
                  color: Colors.white,

                  onPressed: () {
                    tapped();
                  },
                ),*/
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(20),
                  ),
                  child: Icon(
                    Icons.list,
                  ),
                  onPressed: () {tapped();},
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'OverView',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: _myListView(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _myListView(BuildContext context) {
    final titles = ['Cash', 'Cash Balance', 'Net Cash', 'Savings'];

    final icons = [
      Icons.currency_rupee,
      Icons.balance,
      Icons.currency_rupee,
      Icons.savings
    ];

    return ListView.builder(
      itemCount: titles.length,
      itemBuilder: (context, index) {
        return Card(
          //
          child: ListTile(
            leading: Icon(icons[index]),
            title: Text(titles[index]),
            trailing: addbutton(),
          ),
        );
      },
    );
  }

  Widget addbutton() {
    return Container(
        margin: const EdgeInsets.all(5),
        child: FlatButton(
          child: const Text(
            'Add',
            style: TextStyle(fontSize: 15.0),
          ),
          color: Colors.brown,
          textColor: Colors.white,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => AddBill()));
          },
        ));
  }

  tapped() {
    print("ddd");
    _scaffoldKey.currentState!.openDrawer();
  }
}
