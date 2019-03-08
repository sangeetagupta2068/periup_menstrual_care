import 'package:flutter/material.dart';
import 'package:periup/data_models/menstrual_story_post.dart';
import 'package:periup/utils/firebase_database_connectivity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MenstrualCommunityPage extends StatefulWidget {
  @override
  MenstrualCommunityPageState createState() => MenstrualCommunityPageState();
}

class MenstrualCommunityPageState extends State<MenstrualCommunityPage> {
  FirebaseDataBaseConnectivty firebaseDataBaseConnectivty =
      new FirebaseDataBaseConnectivty();

  List<MenstrualStoryPost> _posts = [];

  Firestore firestore = Firestore.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _posts.length,
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
                        _posts[position].authorName,
                        style: TextStyle(color: Colors.redAccent),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                        _posts[position].content),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      "Published on " + DateTime.now().toString(),
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

  void _getData() async {
    firestore.collection('post').getDocuments().then((snapshot) {
      snapshot.documents.forEach((document) {
        _posts.add(MenstrualStoryPost(authorName: document.data['author_name'], content: document.data['post_content']));
      });
      setState(() {});
    });
  }
}
