import 'period_date.dart';

class Person {

    String name;
    String userName;
    String email;
    String gender;
    bool hasPCOD;
    List<PeriodDate> periodDates = new List<PeriodDate>();
    int age;

    Person({this.name,
      this.age,
      this.userName,
      this.email,
      this.gender,
      this.hasPCOD});

    DateTime getNextCycleDate(DateTime recentPeriodDate){

      int duration;
      int count = 0;

        if(periodDates.length > 6){
           count = (periodDates.length - 7);
        }

      while(count<periodDates.length) {
        duration = ((periodDates
            .elementAt(count)
            .menstrualCycleDuration) / count + 1).round();
        ++count;
      }

      return recentPeriodDate.add(Duration(days:duration));
    }

    void setActualCycleDate(DateTime actualDate){
      periodDates.add(PeriodDate(periodDates.last.endPeriodDate, actualDate,true));
      periodDates.last.menstrualCycleDuration = periodDates.last.endPeriodDate
          .difference(periodDates.last.startPeriodDate).inDays;
    }

    bool checkPregnancyStatus(DateTime date,bool intercourseStatus){
        if(periodDates.last.menstrualCycleDuration > 30 && (intercourseStatus)){
           print("Please consult a doctor as you might be pregnant");
           return true;
        }

        return false;
    }

    bool checkPCODStatus(DateTime date,bool familyMemberHasDiabetis){
      if(periodDates.last.menstrualCycleDuration > 30 && (hasPCOD) || (familyMemberHasDiabetis)){
        print("Please consult a doctor as you are showing signs of irregular periods");
        return true;
      }

      return false;
    }

}