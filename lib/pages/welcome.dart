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
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        SizedBox(
          height: 40,
        ),
        Container(
          child: Image.asset(
            'assets/images/logo.png',
            width: 185.0,
          ),
        ),
        Container(
          padding: EdgeInsets.all(12.0),
          width: 300.0,
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
                child: Text(
                  "Welcome",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
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
        ColorBar(Colors.blueAccent),
        ColorBar(Colors.amber),
        ColorBar(Colors.purple),
        ColorBar(Colors.lightGreen),
        ColorBar(Colors.deepOrange),
      ],
    );
  }
}

class ColorBar extends StatelessWidget {
  final color;
  const ColorBar(this.color);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: color,
        height: 185.0,
      ),
    );
  }
}
