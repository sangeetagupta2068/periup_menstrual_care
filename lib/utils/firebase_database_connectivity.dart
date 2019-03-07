import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:periup/data_models/menstrual_story_post.dart';
import 'package:periup/data_models/user.dart';
import 'package:periup/data_models/doctor.dart';

class FirebaseDataBaseConnectivty{

  final CollectionReference userCollectionReference = Firestore.instance.collection('user');
  final CollectionReference postCollectionReference = Firestore.instance.collection('post');

  void insertPostRecord(MenstrualStoryPost post){
    DocumentReference postDocumentReference = postCollectionReference.document(post.userEmail + post.dateTimeOfSignUp.toIso8601String());
    postDocumentReference.setData(<String,Object>{
      'author_name': post.userName,
      'post_content': post.content,
      'post_published_at':post.dateTimeOfSignUp.toIso8601String(),
      'likes': [],
    }).whenComplete((){ print('record added');});
  }

  void insertUserRecord(User user){
    DocumentReference userDocumentReference = userCollectionReference.document(user.email);
    userDocumentReference.setData(<String,String>{
      'user_fullname' : user.fullName,
      'user_type': user.type,
      'user_birthdate' : user.dateTimeOfBirth.toIso8601String(),
      'location': user.location,
      'user_name' : user.userName,

    }).whenComplete((){print('record added for user');});
  }

  void updatePostRecordOnLike(String email,String postId){
    DocumentReference postDocumentReference = postCollectionReference.document(postId);
    postDocumentReference.updateData(<String,Object>{
      'likes' : FieldValueType.arrayUnion,
    });

  }

  void updateUserBio(String email, String bio){
    DocumentReference userDocumentReference = userCollectionReference.document(email);
    userDocumentReference.updateData(<String,Object>{
      'bio' : bio
    });

  }

  void deletPostRecord(MenstrualStoryPost post){
    DocumentReference postDocumentReference = postCollectionReference.document(post.userEmail + post.dateTimeOfSignUp.toIso8601String());
    postDocumentReference.delete();
  }

  void deletUserRecord(String email){
    DocumentReference userDocumentReference = userCollectionReference.document(email);
    userDocumentReference.delete();
  }

  void updateDoctorRecord(Doctor doctor){
    DocumentReference userDocumentReference = userCollectionReference.document(doctor.email);
    userDocumentReference.updateData(<String,Object>{
        'registration_number' : doctor.registrationNumber,
        'hospital_name' : doctor.hospitalName,
        'specialization' : doctor.specialization,
    });
  }


}