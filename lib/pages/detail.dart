import 'package:flutter/material.dart';
import 'package:universityapp/model/lecture.dart';
import 'package:universityapp/services/database.dart';

class DetailPage extends StatelessWidget {
  final Lecture data;

  DetailPage({Key key, @required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data.host_university),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text(
                    "Host University",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  subtitle: Text(
                    data.host_university,
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
                Divider(height: 2.0),
                ListTile(
                  title: Text(
                    "Host Department",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  subtitle: Text(
                    data.host_department,
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
                Divider(height: 2.0),
                ListTile(
                  title: Text(
                    "Host Lecture Name",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  subtitle: Text(
                    data.host_lecture_name,
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
                Divider(height: 2.0),
                ListTile(
                  title: Text(
                    "Host Major",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  subtitle: Text(
                    data.host_major,
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
                Divider(height: 2.0),
                ListTile(
                  title: Text(
                    "Erasmus University",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  subtitle: Text(
                    data.eras_university,
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
                Divider(height: 2.0),
                ListTile(
                  title: Text(
                    "Erasmus Department",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  subtitle: Text(
                    data.eras_department,
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
                Divider(height: 2.0),
                ListTile(
                  title: Text(
                    "Erasmus Lecture Name",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  subtitle: Text(
                    data.eras_lecture_name,
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
                Divider(height: 2.0),
                ListTile(
                  title: Text(
                    "Erasmus Major",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  subtitle: Text(
                    data.eras_major,
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
                Divider(height: 2.0),
                SizedBox(height: 20.0),
              ],
            )),
      ),
    );
  }
}
