import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:universityapp/model/lecture.dart';
import 'package:universityapp/services/database.dart';

class LectureForm extends StatefulWidget {
  @override
  _LectureFormState createState() => _LectureFormState();
}

class _LectureFormState extends State<LectureForm> {
  final formKey = GlobalKey<FormState>();

  String _year = "Please choose academic _year"; // initial value
  String _hostUniversity,
      _hostDepartment,
      _hostMajor,
      _hostLectureId,
      _hostLectureName,
      _erasUniversity,
      _erasDepartment,
      _erasMajor,
      _erasLectureId,
      _erasLectureName,
      _semester;

  void _handleRadioValueChange1(String value) {
    setState(() {
      _semester = value;
      print("Radio value $value");
    });
  }

  void _handleDropDown(String value) {
    setState(() {
      _year = value;
      print("Dropdown value $value");
    });
  }

  void _saveForm() {
    print("- - - - > saveForm function");
    if (formKey.currentState.validate()) {
      formKey.currentState.save(); // save forms

      var data = Lecture(
        host_university: "$_hostUniversity",
        host_department: "$_hostDepartment",
        host_major: "$_hostMajor",
        host_lecture_id: "$_hostLectureId",
        host_lecture_name: "$_hostLectureName",
        eras_university: "$_erasUniversity",
        eras_department: "$_erasDepartment",
        eras_major: "$_erasMajor",
        eras_lecture_id: "$_erasLectureId",
        eras_lecture_name: "$_erasLectureName",
        year: "$_year",
        semester: "$_semester"
      );

      DatabaseService.db.saveLecture(data);

      Fluttertoast.showToast(
          msg: "Lecture is saved!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);

      formKey.currentState.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(18.0),
        child: Form(
          key: formKey,
          child: Column(
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
                    fillColor: Colors.lightBlue[50],
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
                      fillColor: Colors.lightBlue[50]),
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
                    fillColor: Colors.lightBlue[50],
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
                    fillColor: Colors.lightBlue[50],
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
                    fillColor: Colors.lightBlue[50],
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
                    fillColor: Colors.lightBlue[50],
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
                    fillColor: Colors.lightBlue[50],
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
                    fillColor: Colors.lightBlue[50],
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
                    hint: Text(_year),
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
                      groupValue: _semester,
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
                      groupValue: _semester,
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
