import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:universityapp/services/firestore.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final formKey = GlobalKey<FormState>();
  String _name, _email, _message;

  _sendMessage(String name, String email, String message) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int uid = prefs.getInt('uid');
    await FirestoreService().sendContactForm(uid, name, email, message);
  }

  @override
  Widget build(BuildContext context) {
    void _submit() {
      if (formKey.currentState.validate()) {
        formKey.currentState.save(); // save forms
        _sendMessage(_name, _email, _message);

        Fluttertoast.showToast(
            msg: "Your message is sent!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);

        formKey.currentState.reset(); // clear forms
        print("MESSAGE SENT");
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(18.0),
          // margin: EdgeInsets.only(top: 50.0),
          // color: Colors.blueAccent,
          child: Form(
            key: formKey,
            child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    "Contact us",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      hintText: "Your Name",
                      fillColor: Colors.lightBlue[50],
                    ),
                    validator: (String value) {
                      return value.length > 0 ? null : "Field can't be empty";
                    },
                    onSaved: (String value) => _name = value,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      hintText: "Your E-Mail",
                      fillColor: Colors.lightBlue[50],
                    ),
                    validator: (String value) {
                      return value.contains('@')
                          ? null
                          : "Enter a valid email address";
                    },
                    onSaved: (String value) => _email = value,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                      minLines: 5,
                      maxLines: 6,
                      decoration: InputDecoration(
                        filled: true,
                        hintText: "Your Message",
                        fillColor: Colors.lightBlue[50],
                      ),
                      validator: (String value) {
                        return value.length > 0 ? null : "Field can't be empty";
                      },
                      onSaved: (String value) {
                        _message = value;
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                      child: RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    padding: EdgeInsets.fromLTRB(68.0, 12.0, 68.0, 12.0),
                    onPressed: _submit,
                    child: Text("Send"),
                  ))
                ]),
          ),
        ),
      ),
    );
  }
}
