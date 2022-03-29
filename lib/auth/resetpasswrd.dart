import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'login.dart';

class Resetpasswrd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<Resetpasswrd> {
  late String _email ;
  bool isLoading = false;
  TextEditingController emailcontroller = TextEditingController();

  final _formKey = new GlobalKey<FormState>();

  blankMethod() {}

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));
    return Scaffold(body: _body());
  }

  _body() {
    return Form(
        key: _formKey,
        child: SafeArea(
          child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  loginText(),
                  logo(),
                  SizedBox(
                    height: 20,
                  ),
                  headerText("New Password"),
                  emailField(),
                  SizedBox(
                    height: 20,
                  ),
                  headerText("Confirm Password"),
                  emailField(),
                  submitButton(),
                ],
              )),
        ));
  }
  Widget logo() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 0.0),
      child: Image.asset(
        'images/page3.png',
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.bottomCenter,
      ),
    );
  }

  Widget loginText() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(40.0, 20.0, 30.0, 0.0),
        child: SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Align(
                alignment: Alignment.center,
                child: Text(
                  "RESET PASSWORD",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget headerText(String text) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(25.0, 10.0, 40.0, 0.0),
            child: Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget emailField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
      child: TextFormField(
        controller: emailcontroller,
        textInputAction: TextInputAction.next,
        maxLines: 1,
        cursorColor:  Colors.blue,
        keyboardType: TextInputType.text,
        autofocus: false,
        style: TextStyle(fontSize: 16, color: Colors.black),
        textAlign: TextAlign.start,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            // width: 0.0 produces a thin "hairline" border
            borderSide: BorderSide(color: Colors.blue, width: 2.0),
          ),
        ),
        onSaved: (value) => _email = value!.trim(),
        onFieldSubmitted: (value) => FocusScope.of(context).nextFocus(),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter name';
          }
          return null;
        },
      ),
    );
  }
  Widget confirmField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
      child: TextFormField(
        controller: emailcontroller,
        textInputAction: TextInputAction.next,
        maxLines: 1,
        cursorColor:  Colors.blue,
        keyboardType: TextInputType.text,
        autofocus: false,
        style: TextStyle(fontSize: 16, color: Colors.black),
        textAlign: TextAlign.start,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            // width: 0.0 produces a thin "hairline" border
            borderSide: BorderSide(color: Colors.blue, width: 2.0),
          ),
        ),
        onSaved: (value) => _email = value!.trim(),
        onFieldSubmitted: (value) => FocusScope.of(context).nextFocus(),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter name';
          }
          return null;
        },
      ),
    );
  }
  Widget submitButton() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 0.0),
        child: SizedBox(
          height: 50.0,
          width: double.infinity,
          child: RaisedButton(
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              color: Colors.blue,
              child: const Text(
                "Send a code",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              onPressed: _login),
        ));
  }

  _login() {
    Navigator.of(context).pop();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (BuildContext context) => Login()));
  }


}