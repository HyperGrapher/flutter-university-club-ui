import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:universityapp/services/database.dart';

class AddPage extends StatelessWidget {
  _sendData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int uid = prefs.getInt('uid');
    print('- - - - > Firestore UID: $uid');

    await DatabaseService().updateData(
        uid,
        "new host_university",
        "new host_department",
        "new host_major",
        "new_host_lecture_id_5050",
        "new host_lecture_name",
        "new eras_university",
        "new eras_department",
        "new eras_major",
        "new eras_lecture_id",
        "new eras_lecture_name");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: RaisedButton(
          color: Colors.red,
          textColor: Colors.white,
          padding: EdgeInsets.fromLTRB(34.0, 12.0, 34.0, 12.0),
          onPressed: () {
            _sendData();
          },
          child: Text("Send"),
        ),
      ),
    );
  }
}
