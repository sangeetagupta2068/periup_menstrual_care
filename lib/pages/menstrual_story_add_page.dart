import 'package:flutter/material.dart';
import 'package:periup/data_models/user.dart';
import 'package:periup/utils/firebase_database_connectivity.dart';
import 'package:periup/data_models/menstrual_story_post.dart';

class MenstrualStoryPostPage extends StatefulWidget {

  String email;
  MenstrualStoryPostPage(this.email) : super();

  @override
  MenstrualStoryPostPageState createState() => MenstrualStoryPostPageState();
}

class MenstrualStoryPostPageState extends State<MenstrualStoryPostPage> {
  String _postContent;
  TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(text: _postContent);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
            child: Icon(
              Icons.chevron_left,
              color: Colors.white,
              size: 50.0,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          elevation: 0.0,
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  TextField(
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: "What's your menstruation story?",
                    ),
                    controller: _textEditingController,
                    onChanged: (value) => _postContent = value,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: RaisedButton(
                      color: Colors.black,
                      child: Text(
                        "POST",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                         FirebaseDataBaseConnectivty().insertPostRecord(MenstrualStoryPost(
                           content: this._postContent,
                           dateTimeOfPost: DateTime.now(),
                           authorName: "Sangeeta Gupta",
                           userEmail: widget.email,
                         ));
                      },
                    ),
                  )
                ],
              ),
            ),
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.lightBlueAccent, Colors.lightGreenAccent],
            ))));
  }
}
