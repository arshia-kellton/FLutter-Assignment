
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddBill extends StatefulWidget{
  const AddBill({Key? key}) : super(key: key);



  @override
  State<StatefulWidget> createState() => _AddBill();

}

class _AddBill extends State<AddBill>{
  final _formKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  late String _email, _password;

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
         backgroundColor: Colors.white,
       leading: IconButton(
       onPressed: () {
     Navigator.pop(context);
   }, icon: Icon(Icons.home_outlined),
       ),          iconTheme: IconThemeData(color: Colors.black),


         title: Text("Add Bill ", style: TextStyle(color: Colors.grey))),
     body: _body(),
   );
  }

  _body() {

    return Container(
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
                      const SizedBox(
                        height: 20,
                      ),
                      headerText("Name"),
                      NAmeField(),
                      headerText("Next Bill Due"),
                      billdueield(),
                      headerText("Amount"),
                      amtField(),
                      loginButton()


                    ],
                  ))),
      ),
    );

  }
  Widget headerText(String text) {
    return Container(
        child: SizedBox(
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
        ));
  }
  Widget NAmeField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
      child: TextFormField(
        controller: userNameController,
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
            borderSide: BorderSide(color: Colors.brown, width: 2.0),
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
  Widget billdueield() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
      child: TextFormField(
        controller: userNameController,
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
            borderSide: BorderSide(color: Colors.brown, width: 2.0),
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
  Widget amtField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
      child: TextFormField(
        controller: userNameController,
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
            borderSide: BorderSide(color: Colors.brown, width: 2.0),
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
              color: Colors.brown,
              child: const Text(
                "Add Bill",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              onPressed: _performAdd),
        ));
  }

  void _performAdd() {
  }
}