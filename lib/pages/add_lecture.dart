import 'package:flutter/material.dart';

class LectureForm extends StatefulWidget {
  @override
  _LectureFormState createState() => _LectureFormState();
}

class _LectureFormState extends State<LectureForm> {
  final formKey = GlobalKey<FormState>();
  String host_university,
      host_department,
      host_major,
      host_lecture_id,
      host_lecture_name,
      eras_university,
      eras_department,
      eras_major,
      eras_lecture_id,
      eras_lecture_name,
      year,
      semestr;

  _saveForm(
      String host_university,
      String host_department,
      String host_major,
      String host_lecture_id,
      String host_lecture_name,
      String eras_university,
      String eras_department,
      String eras_major,
      String eras_lecture_id,
      String eras_lecture_name,
      String year,
      String semestr) {
    print("- - - - > Form saved");
  }

  @override
  Widget build(BuildContext context) {
    void _submit() {
      if (formKey.currentState.validate()) {
        formKey.currentState.save(); // save forms
        _saveForm(
            host_university,
            host_department,
            host_major,
            host_lecture_id,
            host_lecture_name,
            eras_university,
            eras_department,
            eras_major,
            eras_lecture_id,
            eras_lecture_name,
            year,
            semestr);
        formKey.currentState.reset(); // clear forms
        print("- - - - > Form submitted");
      }
    }

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
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    hintText: "Host University",
                    fillColor: Colors.grey[300],
                  ),
                  validator: (String value) {
                    return value.isNotEmpty ? null : "Field can't be empty";
                  },
                  onSaved: (String value) => host_university = value,
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
                  onSaved: (String value) => host_department = value,
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
                  onSaved: (String value) => host_major = value,
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
                  onSaved: (String value) => host_lecture_name = value,
                ),
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
                  onSaved: (String value) => eras_university = value,
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
                  onSaved: (String value) => eras_department = value,
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
                  onSaved: (String value) => eras_major = value,
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
                  onSaved: (String value) => eras_lecture_name = value,
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                    child: RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: EdgeInsets.fromLTRB(68.0, 12.0, 68.0, 12.0),
                  onPressed: _submit,
                  child: Text("Save Lecture"),
                ))
              ]),
        ),
      ),
    );
  }
}
