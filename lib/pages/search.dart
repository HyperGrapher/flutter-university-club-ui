import 'package:flutter/material.dart';
import 'package:universityapp/model/lecture.dart';
import 'package:universityapp/services/database.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final formKey = GlobalKey<FormState>();
  Future<List<Lecture>> lectureList;
  String query;

  Future<List<Lecture>> findSingle() async {
    print("findSingle() ");
    final response = await DatabaseService.db.queryLecture(query);
    return response;
  }

  Future<List<Lecture>> getAll() async {
    var response = await DatabaseService.db.queryAll();
    return response;
  }

  void _saveForm() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      setState(() {
        lectureList = findSingle();
      });
      // formKey.currentState.reset();
    } else {
      setState(() {
        lectureList = getAll();
      });
      return;
    }
  }

  @override
  void initState() {
    super.initState();
    // Initially list all the data
    lectureList = getAll();
  }

  Widget projectWidget() {
    if (lectureList == null) return Container();
    return FutureBuilder(
        future: lectureList,
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Container(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      Lecture data = snapshot.data[index];
                      return Card(
                        child: ListTile(
                          leading: Icon(Icons.info),
                          title: Text(data.host_university),
                          subtitle: Text(data.eras_university),
                        ),
                      );
                    }));
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(18.0),
            child: Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      hintText: "Search",
                      fillColor: Colors.lightBlue[50],
                    ),
                    validator: (String value) {
                      return value.isNotEmpty ? null : "";
                    },
                    onSaved: (String value) => query = value,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                          color: Colors.blue,
                          textColor: Colors.white,
                          padding: EdgeInsets.fromLTRB(28.0, 12.0, 28.0, 12.0),
                          onPressed: () => {
                            setState(() {
                              lectureList = getAll();
                            formKey.currentState.reset();
                            })
                          },
                          child: Text("RESET"),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        RaisedButton(
                          color: Colors.green,
                          textColor: Colors.white,
                          padding: EdgeInsets.fromLTRB(24.0, 12.0, 24.0, 12.0),
                          onPressed: _saveForm,
                          child: Text("SEARCH"),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
          projectWidget(),
        ],
      ),
    );
  }
}
