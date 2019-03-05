class Person {

    String name;
    String userName;
    String email;
    int age;
    Person(this.name,this.userName,this.email,this.age);

    String medicalHistory;

    String _gender;

    String get gender => _gender;

    set gender(String value) {
      _gender = value;
    }

    bool get intercouseStatus => _intercouseStatus;

    set intercouseStatus(bool value) {
      _intercouseStatus = value;
    }

    DateTime get previousPeriodDate => _previousPeriodDate;

    set previousPeriodDate(DateTime value) {
      _previousPeriodDate = value;
    }

    bool _intercouseStatus;
    DateTime _previousPeriodDate;
    DateTime _currentPeriodDate;

    DateTime get currentPeriodDate => _currentPeriodDate;

    set currentPeriodDate(DateTime value) {
      _currentPeriodDate = value;
    }



}