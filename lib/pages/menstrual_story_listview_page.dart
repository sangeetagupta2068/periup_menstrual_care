import 'package:flutter/material.dart';
import 'package:periup/utils/firebase_database_connectivity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MenstrualCommunityPage extends StatefulWidget{
  @override
  MenstrualCommunityPageState createState() => MenstrualCommunityPageState();
}

class MenstrualCommunityPageState extends State<MenstrualCommunityPage>{

  FirebaseDataBaseConnectivty firebaseDataBaseConnectivty = new FirebaseDataBaseConnectivty();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
       stream: firebaseDataBaseConnectivty.getPostItems(),
       builder: (context,snapshot){
         if(!snapshot.hasData) return LinearProgressIndicator();

         return Card(
           elevation: 5.0,
           child: Padding(
             padding: const EdgeInsets.only(top: 14.0,bottom: 14.0,left: 12.0,right: 12.0),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: <Widget>[
                 Row(
                   children: <Widget>[
                     Icon(Icons.account_circle,size: 30.0),
                     Text(" userName",style: TextStyle(color: Colors.redAccent),),
                   ],
                 ),
                 Padding(
                   padding: const EdgeInsets.all(10.0),
                   child: Text("This is where the user is going to post her menstrual story."),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(left: 10.0),
                   child: Text("Published on " + DateTime.now().toString(), style: TextStyle(color: Colors.blueGrey),),
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
       }
    );
  }

}