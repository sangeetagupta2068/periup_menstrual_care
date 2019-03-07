import 'package:flutter/material.dart';

class MenstrualStoryPost extends StatefulWidget {
  @override
  MenstrualStoryPostState createState() => MenstrualStoryPostState();
}

class MenstrualStoryPostState extends State<MenstrualStoryPost> {

  String _note;
  TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = new TextEditingController(text: _note);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading:
          InkWell(
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                  decoration: new InputDecoration(
                    hintText: 'Optional note',
                  ),
                  controller: _textEditingController,
                  onChanged: (value) => _note = value,
                ),
              RaisedButton(
                color: Colors.black,
                child: Text("POST",style: TextStyle(color: Colors.white),),
                onPressed: (){},
              )

            ],
          ),

//            child:Column(
//              children: <Widget>[
//                Expanded(
//                  flex: 4,
//                  child: Card(
//                    child: TextField(
//                        decoration: InputDecoration(
//                          hintText: "Share your menstrual story to the world",
//                          border: InputBorder.none,
//                          hintStyle: TextStyle(color: Colors.black54, fontSize: 18.0),
//                        )),
//                  ),
//                )
//              ],
//
//            ),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
              Colors.lightBlueAccent,
              Colors.lightGreenAccent
            ],
                ))));
  }
}
