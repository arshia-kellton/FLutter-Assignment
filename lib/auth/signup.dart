import 'dart:async';
import 'package:expense_manager/auth/forgot_pwd.dart';
import 'package:expense_manager/auth/homepqge.dart';
import 'package:expense_manager/auth/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../utilities/sharedPrefrence.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  late String _email, _password;
  String _emailResult = "", _passwordResult = "";
  TextEditingController firstController = TextEditingController();
  TextEditingController lastController = TextEditingController();

  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  // final _auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));
    return Scaffold(body: _body());
  }

  _body() {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Form(
          key: _formKey,
          child: SingleChildScrollView(
              child: SafeArea(
                  top: true,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      loginText(),
                      logo(),
                      const SizedBox(
                        height: 20,
                      ),
                      headerText("First Name"),
                      firstField(),
                      headerText("Last Name"),
                      lastField(),
                      headerText("Email Address"),
                      emailField(),
                      headerText("Password"),
                      passwordField(),
                      headerText("Phone Number"),
                      phoneField(),
                      loginButton(),
                      signUp(),
                    ],
                  )))),
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
                  "SIGN IN",
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

  Widget logo() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 0.0),
      child: Image.asset(
        'images/page4.png',
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.bottomCenter,
      ),
    );
  }

  Widget emailField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
      child: TextFormField(
        controller: emailController,
        textInputAction: TextInputAction.next,
        maxLines: 1,
        cursorColor:  Colors.blue,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        style: const TextStyle(fontSize: 16, color: Colors.black),
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
  Widget firstField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
      child: TextFormField(
        controller: firstController,
        textInputAction: TextInputAction.next,
        maxLines: 1,
        cursorColor:  Colors.blue,
        keyboardType: TextInputType.text,
        autofocus: false,
        style: const TextStyle(fontSize: 16, color: Colors.black),
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
  Widget lastField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
      child: TextFormField(
        controller: lastController,
        textInputAction: TextInputAction.next,
        maxLines: 1,
        cursorColor:  Colors.blue,
        keyboardType: TextInputType.text,
        autofocus: false,
        style: const TextStyle(fontSize: 16, color: Colors.black),
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
  Widget phoneField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
      child: TextFormField(
        controller: phoneController,
        textInputAction: TextInputAction.next,
        maxLines: 1,

        cursorColor:  Colors.blue,
        keyboardType: TextInputType.number,
        autofocus: false,
        style: const TextStyle(fontSize: 16, color: Colors.black),
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
  Widget passwordField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10.0, 20.0, 0.0),
      child: TextFormField(
        controller: passwordController,
        maxLines: 1,
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        autofocus: false,
        textAlign: TextAlign.start,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 2.0),
          ),
        ),
        onSaved: (value) => _password = value!.trim(),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter  password';
          }
          return null;
        },
      ),
    );
  }

  Widget loginButton() {
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
                "Sign Up",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              onPressed: _performLogin),
        ));
  }


  Widget signUp() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 20.0),
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("I am a old user.",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey)),
            InkWell(
                child: const Text("Sign In",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    )),
                onTap: _signUp),
          ],
        ),
      ),
    );
  }

  _signUp() {
       Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => Login()));
  }

  String? validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.'
        r'[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (value.trim().toString().length == 0) {
      return "Enter email-id";
    } else if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }
  String? validatePassword(String value) {
    _password = value;
    if (value.trim().length == 0) {
      return "Enter password";
    } else if (value.length <= 8)
      return 'Password must be more than 8 character';
    else
      return null;
  }

  _performLogin() async {
    final form = _formKey.currentState;
    if (_formKey.currentState!.validate()) {
      form!.save();
      /*Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => HomePage()));*/
      {
        setState(() {
          showSpinner = true;
        });
        try {

          final newUser = await _auth.createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
          if (newUser != null) {
            print(newUser.credential);
            SharedPrefUtil.setUsrname("username",emailController.text);

            Navigator.push(
                context, MaterialPageRoute(builder: (BuildContext context) => Homepage()));
          }

          setState(() {
            showSpinner = false;
          });
        } catch (e) {
          showSpinner = false;

          print(e);
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
  }

  forgotTap() {
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => ForgotPassword()));
  }
}


