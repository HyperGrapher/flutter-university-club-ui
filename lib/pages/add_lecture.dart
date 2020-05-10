import 'package:flutter/material.dart';

class LectureForm extends StatefulWidget {
  @override
  _LectureFormState createState() => _LectureFormState();
}

class _LectureFormState extends State<LectureForm> {
  final formKey = GlobalKey<FormState>();

  String semester = '';
  String year = "Please choose academic year"; // initial value
  String _hostUniversity,
      _hostDepartment,
      _hostMajor,
      _hostLectureId,
      _hostLectureName,
      _erasUniversity,
      _erasDepartment,
      _erasMajor,
      _erasLectureId,
      _erasLectureName;

  void _handleRadioValueChange1(String value) {
    setState(() {
      semester = value;
      print("Radio value $value");
    });
  }

  void _handleDropDown(String value) {
    setState(() {
      year = value;
      print("Dropdown value $value");
    });
  }

  void _saveForm() {
    print("- - - - > Form saved");
    if (formKey.currentState.validate()) {
      formKey.currentState.save(); // save forms

      print("Host Uni: $_hostUniversity");
      print("Host Department: $_hostDepartment");
      print("year: $year");
      print("semester: $semester");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                  "Add New Matched Lecture",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Host University",
                  style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                Divider(height: 5.0, color: Colors.black),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    hintText: "Host University",
                    fillColor: Colors.grey[300],
                  ),
                  validator: (String value) {
                    return value.isNotEmpty ? null : "Field can't be empty";
                  },
                  onSaved: (String value) => _hostUniversity = value,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    hintText: "Host Department",
                    fillColor: Colors.grey[300],
                  ),
                  validator: (String value) {
                    return value.isNotEmpty ? null : "Field can't be empty";
                  },
                  onSaved: (String value) => _hostDepartment = value,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    hintText: "Host Major",
                    fillColor: Colors.grey[300],
                  ),
                  validator: (String value) {
                    return value.isNotEmpty ? null : "Field can't be empty";
                  },
                  onSaved: (String value) => _hostMajor = value,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    hintText: "Host Lecture",
                    fillColor: Colors.grey[300],
                  ),
                  validator: (String value) {
                    return value.isNotEmpty ? null : "Field can't be empty";
                  },
                  onSaved: (String value) => _hostLectureName = value,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Erasmus University",
                  style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                Divider(height: 5.0, color: Colors.black),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    hintText: "Erasmus University",
                    fillColor: Colors.grey[300],
                  ),
                  validator: (String value) {
                    return value.isNotEmpty ? null : "Field can't be empty";
                  },
                  onSaved: (String value) => _erasUniversity = value,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    hintText: "Erasmus Department",
                    fillColor: Colors.grey[300],
                  ),
                  validator: (String value) {
                    return value.isNotEmpty ? null : "Field can't be empty";
                  },
                  onSaved: (String value) => _erasDepartment = value,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    hintText: "Erasmus Major",
                    fillColor: Colors.grey[300],
                  ),
                  validator: (String value) {
                    return value.isNotEmpty ? null : "Field can't be empty";
                  },
                  onSaved: (String value) => _erasMajor = value,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    hintText: "Erasmus Lecture",
                    fillColor: Colors.grey[300],
                  ),
                  validator: (String value) {
                    return value.isNotEmpty ? null : "Field can't be empty";
                  },
                  onSaved: (String value) => _erasLectureName = value,
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: DropdownButton<String>(
                    items: <String>['2019', '2020', '2021', '2022']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: _handleDropDown,
                    hint: Text(year),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    'Semester',
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Radio(
                      value: "Fall",
                      groupValue: semester,
                      onChanged: _handleRadioValueChange1,
                    ),
                    Text(
                      'Fall',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    Radio(
                      value: "Spring",
                      groupValue: semester,
                      onChanged: _handleRadioValueChange1,
                    ),
                    Text(
                      'Spring',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                    child: RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: EdgeInsets.fromLTRB(68.0, 12.0, 68.0, 12.0),
                  onPressed: _saveForm,
                  child: Text("Save Lecture"),
                )),
                SizedBox(
                  height: 30,
                ),
              ]),
        ),
      ),
    );
  }
}
