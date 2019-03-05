import 'period_date.dart';

class Person {

    String name;
    String userName;
    String email;
    String medicalHistory;
    String gender;
    bool intercouseStatus;
    List<PeriodDate> periodDates = new List<PeriodDate>();
    int age;

    Person({this.name,
      this.age,
      this.userName,
      this.email,
      this.medicalHistory,
      this.gender,
      this.intercouseStatus,});

    DateTime getNextCycleDate(DateTime recentPeriodDate){

      int duration;
      int count = 0;

        if(periodDates.length > 6){
           count = (periodDates.length - 7);
        }

      while(count<periodDates.length){
        duration = ((periodDates.elementAt(count).menstrualCycleDuration)/count+1).round();
        ++count;
      }

      return recentPeriodDate.add(Duration(days:duration));
    }

    void setActualCycleDate(DateTime actualDate){
      periodDates.add(PeriodDate(periodDates.elementAt(periodDates.length -1).endPeriodDate, actualDate,true));
    }

}