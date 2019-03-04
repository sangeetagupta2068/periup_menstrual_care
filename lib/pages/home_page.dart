import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:periup/utils/firebase_user_authentication.dart';

class HomePage extends StatefulWidget {
  FirebaseUser firebaseUser;
  FirebaseAuthentication firebaseGoogleAuthentication;

  HomePage({this.firebaseUser, this.firebaseGoogleAuthentication}) : super();
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(),

        body: Center(
          child: Text("Signed in"),
        ),

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (int index) => setState(() {
            this.index = index;
          }),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.group,
                  size: 20.0,
                  color: Colors.black,
                ),
                title: Text(
                  "Forum",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w400),
                )),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_today,
                size: 20.0,
                color: Colors.black,
              ),
              title: Text(
                "Calender",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w400),
              ),

            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.add_call,
                  size: 20.0,
                  color: Colors.black,
                ),
                title: Text(
                  "HealthCare",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w400),
                ))
          ],
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.black,
          child: Icon(Icons.add),
        ),

        drawer: Drawer(
            child: Column(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.lightBlueAccent,
                            Colors.lightGreenAccent
                          ])),
                  accountName: Text(
                    widget.firebaseUser.displayName,
                    style: TextStyle(color: Colors.black),
                  ),
                  accountEmail: Text(
                    widget.firebaseUser.email,
                    style: TextStyle(color: Colors.black),
                  ),
                  currentAccountPicture: Icon(
                    Icons.account_circle,
                    size: 50.0,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: ListView(
                    padding: EdgeInsets.only(top: 0.0),
                    children: <Widget>[
                      ListTile(
                        title: Text("Edit Profile"),
                        leading: Icon(
                          Icons.mode_edit,
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        title: Text("Favourites"),
                        leading: Icon(
                            Icons.star_border
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        title: Text("Reminders"),
                        leading: Icon(
                            Icons.notifications
                        ),
                        onTap: (){},
                      ),
                      ListTile(
                        title: Text("Help and Support"),
                        leading: Icon(Icons.help_outline),
                        onTap: (){},
                      ),
                      ListTile(
                        title: Text("Sign Out"),
                        leading: Icon(Icons.account_circle),
                        onTap: () {
                          widget.firebaseGoogleAuthentication
                              .firebaseGoogleSignOut();
                          Navigator.popUntil(context,
                              ModalRoute.withName(Navigator.defaultRouteName));
                        },
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }
}
