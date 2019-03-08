class User {
  String userName;
  String fullName;
  String userId;
  String email;
  String type;
  String bio;
  DateTime dateTimeOfBirth;
  String location;
  String profilePictureURL;

  User(
      {this.userName,
      this.fullName,
      this.userId,
      this.email,
      this.type,
      this.dateTimeOfBirth,
      this.location,
      this.bio = "",
      this.profilePictureURL});

  int getUserAge() {
    int age = DateTime.now().year - dateTimeOfBirth.year - 1;
    if (DateTime.now().month > dateTimeOfBirth.month) {
      age = age + 1;
    } else if (DateTime.now().month == dateTimeOfBirth.month) {
      if (dateTimeOfBirth.day >= DateTime.now().day) {
        age = age + 1;
      }
    }
  }
}
