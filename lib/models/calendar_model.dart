import 'package:intl/intl.dart';

class CalendarModel {
  final int month;
  final List<dynamic> schedules;
  CalendarModel({required this.month, required this.schedules});

  factory CalendarModel.fromJson(Map<String, dynamic> json) {
    return CalendarModel(
      month: json['month'],
      schedules: json['schedules'],
    );
  }
}

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

class CalendarDetailModel {
  int id;
  String petName;
  String? alarmTime;
  int? cycle;
  int? cycleCount;
  String? cycleType;
  bool hasRepeat;
  bool hasAlarm;
  String scheduleTime;
  String scheduleType;
  String? customScheduleTitle;
  String? text;

  CalendarDetailModel({
    required this.id,
    required this.petName,
    required this.alarmTime,
    required this.cycle,
    required this.cycleCount,
    required this.cycleType,
    required this.hasRepeat,
    required this.hasAlarm,
    required this.scheduleTime,
    required this.scheduleType,
    required this.customScheduleTitle,
    required this.text,
  });

  factory CalendarDetailModel.fromJson(Map<String, dynamic> json) {
    return CalendarDetailModel(
      id: json['id'],
      petName: json['petName'],
      alarmTime: json['alarmTime'],
      cycle: json['cycle'],
      cycleCount: json['cycleCount'],
      cycleType: json['cycleType'],
      hasRepeat: json['hasRepeat'],
      hasAlarm: json['hasAlarm'],
      scheduleTime: json['scheduleTime'],
      scheduleType: json['scheduleType'],
      customScheduleTitle: json['customScheduleTitle'],
      text: json['text'],
    );
  }
}
