//class CalenderGoogleAuthentication{
//
//    GoogleSignInAuthentication googleSignInAuthentication;
//
//   CalenderGoogleAuthentication(GoogleSignInAuthentication googleSignInAuthentication) {this.googleSignInAuthentication = googleSignInAuthentication; }
//   var scope = [CalendarApi.CalendarScope];
//
//   void setCalenderApiConnection() async{
//      var accessToken =  googleSignInAuthentication.accessToken;
//      AuthClient client = Au
//   }
//
//    void getCalenderEvents() async{
//
////      clientViaServiceAccount(serviceAccountCredentials, scope).then((AuthClient client) {
////
////        print("hello world");
////
////        var calenderApi = CalendarApi(client);
////        print(client.toString());
////        print(calenderApi.events.toString());
////
////        var personalEvents = calenderApi.events.list(
////            "primary",
////          singleEvents: true,
////          maxResults: 10,
////        );
////
////        personalEvents.then((Events events){
////          for(int count = 0; count < events.items.length ; count ++){
////            print(count.toString() + " " + events.items[count].summary.toString());
////          }
////        });
////
////        print(personalEvents.toString());
////
////        client.close();
////      });
////    }
//}
//
////{"installed":{"client_id":"60582202322-ck6m8sb1vbld87o02olkjm0siqkln3f1.apps.googleusercontent.com"
//// ,"project_id":"periup-deeef",
//// "auth_uri":"https://accounts.google.com/o/oauth2/auth",
//// "token_uri":"https://oauth2.googleapis.com/token","auth_provider_x509_cert_url"
//// :"https://www.googleapis.com/oauth2/v1/certs",
//// "redirect_uris":["urn:ietf:wg:oauth:2.0:oob","http://localhost"]}}
//
////client id for ios: <?xml version="1.0" encoding="UTF-8"?>
////<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
////<plist version="1.0">
////<string>60582202322-0630gj1pn5bet7um8l3bjnaevrqpntp6.apps.googleusercontent.com</string>
////</plist>