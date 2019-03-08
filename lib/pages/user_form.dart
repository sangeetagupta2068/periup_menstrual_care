import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:periup/pages/home_page.dart';
import 'package:periup/data_models/user.dart';
import 'package:periup/utils/firebase_database_connectivity.dart';
import 'package:periup/utils/firebase_user_authentication.dart';

class UserDetailPage extends StatefulWidget {
  FirebaseUser firebaseUser;
  FirebaseAuthentication firebaseGoogleAuthentication;

  UserDetailPage(this.firebaseUser,this.firebaseGoogleAuthentication) : super();
  @override
  _UserDetailPageState createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {

  FirebaseDataBaseConnectivty firebaseDataBaseConnectivty = FirebaseDataBaseConnectivty();
  DateTime selectedDate = DateTime.now();
  String selectText = "Select Date";
  String location = "";
  String bio ="";
  TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(text: bio);
  }


  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900, 8),
        lastDate: DateTime(2020));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        selectText = selectedDate.toIso8601String();
      });
  }

  @override
  Widget build(BuildContext context) {

    var signInAppBar = AppBar(
      elevation: 0.0,
      backgroundColor: Colors.lightBlueAccent,
    );

    var signInBody = Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.lightBlueAccent, Colors.lightGreenAccent])),
        child: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 24.0, right: 24.0,top: 30.0),
            children: <Widget>[
              SizedBox(height: 40.0,),
              Text("Bio:", style: TextStyle(fontSize: 20.0),),
              TextField(
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: "Tell us about yourself",
                ),
                controller: _textEditingController,
                onChanged: (value) => this.bio = value,
              ),
              SizedBox(height: 30.0,),
              Text("Date of birth:", style: TextStyle(fontSize: 20.0),),
              FlatButton(
                padding: EdgeInsets.only(left: 0.0, right: 0.0),
                child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(selectText,style: TextStyle(color: Colors.blueGrey,fontSize: 15.0),),
                      Icon(Icons.keyboard_arrow_down),
                    ]),
                onPressed: () {
                  _selectDate(context);
                  } ,
              ),
              SizedBox(height: 30.0,),
              Text("City:"),
              TextField(
                maxLines: 1,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "Currently located city",
                ),
              ),
              SizedBox(height: 50.0),
              RaisedButton(
                color: Colors.black,
                child: Text(
                  "SUBMIT",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  firebaseDataBaseConnectivty.insertUserRecord(User(
                    fullName: widget.firebaseUser.displayName,
                    email: widget.firebaseUser.email,
                    location: this.location,
                    profilePictureURL: widget.firebaseUser.photoUrl,
                    bio : this.bio,
                    type: "user_applicant",
                    dateTimeOfBirth: this.selectedDate,
                  ),);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(widget.firebaseUser, widget.firebaseGoogleAuthentication)));
                },
              ),
            ],
          ),
        ),
    );

    return Scaffold(appBar: signInAppBar, body: signInBody);
  }
}
