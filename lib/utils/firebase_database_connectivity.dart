import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:periup/data_models/menstrual_story_post.dart';
import 'package:periup/data_models/user.dart';
//import 'package:periup/data_models/doctor.dart';

class FirebaseDataBaseConnectivty {
  final CollectionReference userCollectionReference =
      Firestore.instance.collection('user');
  final CollectionReference postCollectionReference =
      Firestore.instance.collection('post');
//  final CollectionReference doctorCollectionReference = Firestore.instance.collection('doctor');

  void insertPostRecord(MenstrualStoryPost post) {
    DocumentReference postDocumentReference = postCollectionReference
        .document(post.userEmail + post.dateTimeOfPost.toIso8601String());
    postDocumentReference.setData(<String, Object>{
      'author_name': post.authorName,
      'post_content': post.content,
      'post_published_at': post.dateTimeOfPost.toIso8601String(),
      'likes': [],
    }).whenComplete(() {
      print('record added');
    });
  }

//  User getUserRecord(String email){
//    DocumentReference userDocumentReference = userCollectionReference.document(email);
//    userDocumentReference.get();
//  }

  void insertUserRecord(User user) {
    DocumentReference userDocumentReference =
        userCollectionReference.document(user.email);
    userDocumentReference.setData(<String, String>{
      'user_fullname': user.fullName,
      'user_type': user.type,
      'user_bio': user.bio,
      'user_birthdate': user.dateTimeOfBirth.toIso8601String(),
      'location': user.location,
      'user_email': user.email,
    }).whenComplete(() {
      print('record added for user');
    });
  }

  void updatePostRecordOnLike(String email, String postId) {
    DocumentReference postDocumentReference =
        postCollectionReference.document(postId);
    postDocumentReference.updateData(<String, Object>{
      'likes': FieldValueType.arrayUnion,
    });
  }

  void deletPostRecord(MenstrualStoryPost post) {
    DocumentReference postDocumentReference = postCollectionReference
        .document(post.userEmail + post.dateTimeOfPost.toIso8601String());
    postDocumentReference.delete();
  }

  void deletUserRecord(String email) {
    DocumentReference userDocumentReference =
        userCollectionReference.document(email);
    userDocumentReference.delete();
  }

//  void insertDoctorRecord(Doctor doctor){
//    DocumentReference doctorDocumentReference = doctorCollectionReference.document(doctor.email);
//     doctorDocumentReference.setData(<String,Object>{
//       'doctor_fullname' : doctor.fullName,
//       'doctor_type': doctor.type,
//       'doctor_birthdate' : doctor.dateTimeOfBirth.toIso8601String(),
//       'location': doctor.location,
//       'doctor_name' : doctor.userName,
//        'registration_number' : doctor.registrationNumber,
//        'hospital_name' : doctor.hospitalName,
//        'specialization' : doctor.specialization,
//    });
//  }

  Stream<QuerySnapshot> getPostItems() {
    return postCollectionReference.snapshots();
  }

//  List<Map<String,Object>> getDoctorItems(){
//
//    List<Map<String,Object>> doctorPosts;
//    doctorCollectionReference.getDocuments().then((doctorItemsSnapshot){
//      doctorItemsSnapshot.documents.forEach((doctorItemSnapshot){
//          doctorPosts.add(doctorItemSnapshot.data);
//      });
//      return doctorPosts;
//    });
//  }

}
