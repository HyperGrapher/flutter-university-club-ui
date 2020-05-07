import 'package:flutter/material.dart';
import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';

class WelcomePage extends StatelessWidget {
  _createUID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int uid = (prefs.getInt('uid') ?? 0);
    // Create uid for firebase database
    if (uid == 0) {
      print("No Previous UID, generating new one");
      Random random = new Random();
      int randomUID = random.nextInt(1000000); 
      await prefs.setInt('uid', randomUID);
      print("Generated UID: $randomUID");
    } else {
      print("UID already exist: $uid");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber[300],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Container(
              child: Image.asset(
                'assets/images/logo.png',
                width: 250.0,
              ),
            ),
            Container(
              padding: EdgeInsets.all(12.0),
              width: 250.0,
              height: 250.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(
                color: Colors.black26,
                width: 2.0,
                style: BorderStyle.solid,
              )),
              child: Text(
                "Lecture Matching",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 50.0,
                ),
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                BottomBars(),
                Center(
                  child: RaisedButton(
                    color: Colors.white,
                    textColor: Colors.black,
                    padding: EdgeInsets.fromLTRB(34.0, 12.0, 34.0, 12.0),
                    onPressed: () {
                      _createUID();
                      Navigator.pushNamed(context, '/home');
                    },
                    child: Text("Welcome"),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}

class BottomBars extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Expanded(
          child: Container(
            color: Colors.blueAccent,
            height: 185.0,
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.amber,
            height: 185.0,
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.purple,
            height: 185.0,
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.lightGreen,
            height: 185.0,
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.deepOrange,
            height: 185.0,
          ),
        ),
      ],
    );
  }
}
