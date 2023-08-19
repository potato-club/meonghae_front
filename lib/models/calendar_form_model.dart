import 'package:intl/intl.dart';

class CalendarFormModel {
  int? petId;
  DateTime alarmTime;
  int alarmDate;
  String? cycle;
  int cycleCount;
  String? cycleType;
  bool hasRepeat;
  bool hasAlarm;
  DateTime scheduleTime;
  String? scheduleType;

  CalendarFormModel({
    required this.petId,
    required this.alarmTime,
    required this.alarmDate,
    required this.cycle,
    required this.cycleCount,
    required this.cycleType,
    required this.hasRepeat,
    required this.hasAlarm,
    required this.scheduleTime,
    required this.scheduleType,
  });

  bool isFilled() {
    if (hasRepeat) {
      if (petId != null &&
          cycle != null &&
          cycleType != null &&
          scheduleType != null) {
        return true;
      } else {
        return false;
      }
    } else {
      if (petId != null && scheduleType != null) {
        return true;
      } else {
        return false;
      }
    }
  }

  String alarmTimeFormat(int day, DateTime time) {
    DateTime date = time.add(Duration(days: day));
    return DateFormat('yyyy-MM-ddTHH:mm').format(date);
  }
}
