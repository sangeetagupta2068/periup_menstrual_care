import 'package:flutter/material.dart';

class TermsOfUsePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.lightBlueAccent,
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
        ),
          body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.lightBlueAccent, Colors.lightGreenAccent])),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 24.0, right: 24.0, top: 55.0, bottom: 70.0),
              child: Center(
               child: ListView(
                  children: <Widget>[
                    Text("Terms of Use",style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.w700, color: Colors.black),),
                    Text("\n\n"+ "Welcome to Periup!"
                        + "\n\n"
                        + "These Terms of Use govern your use of Periup and provide information about the Periup service, outlined below."
                        + "When you create an Periup account or use Periup,you agree to the following terms:"
                        + "\n\nThe Data Policy"
                        + "\n\nProviding our service requires collecting data and using your information including accessing your email, content created and shared by you and personal calendar."
                        + "\n\nThe Periup Service"
                        +"\n\nWe are providing you with a personalized period tracking calender,forum to share your menstrual stories and connecting with your nearest doctors"
                        +"\n\nYour commitments"
                        +"\n\nIn return for our commitment to provide the Service, we require you to adhere the following:"
                        +"\n\nYou must be at least 13 years old to use Periup"
                        +'\nYou must not be a convicted sex offender'
                        +"\nWe must not have previously disabled your account for violation of law or anyof our policies"
                        +"\nYou must not impersonate others or provide inaccurate information"
                        +"\nYou cannot do anything unlawful,misleading or fraudulent or for an illegal or unauthorized purpose"
                        +"\nYou cannot attempt post private or confidential information which violates someone else's rights"
                        +"\nPlease note our support group provides voluntery service and hence we recommend you to consult your doctor before taking any medication provided by our consultants."
                        +"\nWe will not be responsible for any kind of casualties."
                        +"\n\nFor any further queries,feel free to reach us at periup@gmail.com"
                    ),
                  ],
                )
              )
            ),
          ),
        );
  }
}
