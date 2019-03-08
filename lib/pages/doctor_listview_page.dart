import 'package:flutter/material.dart';

class DoctorListPage extends StatefulWidget {
  @override
  DoctorListState createState() => DoctorListState();
}

class DoctorListState extends State<DoctorListPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
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
                        " Doctor name",
                        style: TextStyle(color: Colors.redAccent),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("This is where the doctor bio comes in."),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      "Ratings " + DateTime.now().toString(),
                      style: TextStyle(color: Colors.blueGrey),
                    ),
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
        });
  }
}
