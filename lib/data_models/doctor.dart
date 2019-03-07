import 'user.dart';

class Doctor extends User {
  String registrationNumber;
  String hospitalName;
  String specialization;

  Doctor(this.registrationNumber, this.hospitalName, this.specialization,
      String userName, String email, String city, DateTime dateOfBirth, String fullName,
      String type, String userId, String location,{String bio = ""}) :
        super(userName, fullName, userId, email, type, dateOfBirth,location,bio: bio);
}
