import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:periup/data_models/user.dart';

class DoctorsPage extends StatefulWidget {
  @override
  _DoctorsPageState createState() => _DoctorsPageState();
}

class _DoctorsPageState extends State<DoctorsPage> {

  List<User> _doctors = [];

  Firestore store = Firestore.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.lightBlueAccent,
        title: Text("Doctors"),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.lightBlueAccent, Colors.lightGreenAccent])),
        child: ListView.builder(
          itemCount: _doctors.length,
          itemBuilder: (context, position) {
            return Card(
              elevation: 5.0,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 14.0, bottom: 14.0, left: 12.0, right: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.account_circle, size: 30.0),
                        Text(
                          _doctors[position].fullName,
                          style: TextStyle(color: Colors.redAccent),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                          _doctors[position].location),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Icon(Icons.sentiment_satisfied),
                        Text("  "),
                        Icon(Icons.sentiment_dissatisfied),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
      ),
    );
  }

  void _getData() async {
    store.collection('user').where('isDoctor', isEqualTo: "true").getDocuments().then((snapshot) {
      snapshot.documents.forEach((document) {
        _doctors.add(User(fullName: document.data['user_fullname'], email: document.data['user_email'], location: document.data['location']));
      });
      setState(() {

      });
    });
  }

}
