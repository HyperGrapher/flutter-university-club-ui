import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(18.0),
        // margin: EdgeInsets.only(top: 50.0),
        // color: Colors.blueAccent,
        child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                "About Ege University",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Center(
                child: ButtonTheme(
                  minWidth: 250.0,
                  height: 70.0,
                  child: RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () => Navigator.pushNamed(context, '/library'),
                    child: Text(
                      "Central Library",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: ButtonTheme(
                  minWidth: 250.0,
                  height: 70.0,
                  child: RaisedButton(
                    color: Colors.pink,
                    textColor: Colors.white,
                    onPressed: () => Navigator.pushNamed(context, '/pool'),
                    child: Text(
                      "Swimming Pool",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: ButtonTheme(
                  minWidth: 250.0,
                  height: 70.0,
                  child: RaisedButton(
                    color: Colors.green,
                    textColor: Colors.white,
                    onPressed: () => Navigator.pushNamed(context, '/health'),
                    child: Text(
                      "Medico Health Center",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: ButtonTheme(
                  minWidth: 250.0,
                  height: 70.0,
                  child: RaisedButton(
                    color: Colors.blue[900],
                    textColor: Colors.white,
                    onPressed: () => Navigator.pushNamed(context, '/gym'),
                    child: Text(
                      "Ege Gymnasium",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: ButtonTheme(
                  minWidth: 250.0,
                  height: 70.0,
                  child: RaisedButton(
                    color: Colors.deepOrangeAccent,
                    textColor: Colors.white,
                    onPressed: () => Navigator.pushNamed(context, '/dining'),
                    child: Text(
                      "Dining Halls",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
