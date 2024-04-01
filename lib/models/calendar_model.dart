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
  int? alarmDate;
  String? cycle;
  int? cycleCount;
  String? cycleType;
  bool hasRepeat;
  bool hasAlarm;
  DateTime scheduleTime;
  String? scheduleType;

  CalendarFormModel({
    this.petId,
    required this.alarmTime,
    this.alarmDate,
    this.cycle,
    this.cycleCount,
    this.cycleType,
    required this.hasRepeat,
    required this.hasAlarm,
    required this.scheduleTime,
    this.scheduleType,
  });

  bool isFilled() {
    if (scheduleType != null) {
      if (hasRepeat) {
        if (cycle != null && cycleType != null) {
          return true;
        } else {
          return false;
        }
      } else {
        return true;
      }
    } else {
      return false;
    }
  }

  String alarmTimeFormat(int day, DateTime alarmTime, DateTime scheduleTime) {
    var time = alarmTime.copyWith(
        year: scheduleTime.year,
        month: scheduleTime.month,
        day: scheduleTime.day);
    DateTime date = time.add(Duration(days: day));
    return DateFormat('yyyy-MM-ddTHH:mm').format(date);
  }
}

class CalendarDetailModel {
  int id;
  int? petId;
  String? petName;
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
    this.petId,
    this.petName,
    this.alarmTime,
    this.cycle,
    this.cycleCount,
    this.cycleType,
    required this.hasRepeat,
    required this.hasAlarm,
    required this.scheduleTime,
    required this.scheduleType,
    this.customScheduleTitle,
    this.text,
  });

  factory CalendarDetailModel.fromJson(Map<String, dynamic> json) {
    return CalendarDetailModel(
      id: json['id'],
      petId: json['petId'],
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

  bool isFilled(bool customMode, String title) {
    if (customMode) {
      if (title.isNotEmpty) {
        if (hasRepeat) {
          if (cycle != null && cycleType != null) {
            return true;
          } else {
            return false;
          }
        } else {
          return true;
        }
      } else {
        return false;
      }
    } else {
      if (scheduleType != null) {
        if (hasRepeat) {
          if (cycle != null && cycleType != null) {
            return true;
          } else {
            return false;
          }
        } else {
          return true;
        }
      } else {
        return false;
      }
    }
  }

  String alarmTimeFormat(int day, String alarmTime, String scheduleTime) {
    var schedule = DateTime.parse(scheduleTime);
    var time = DateTime.parse(alarmTime).copyWith(
        year: schedule.year, month: schedule.month, day: schedule.day);
    DateTime date = time.add(Duration(days: day));
    return DateFormat('yyyy-MM-ddTHH:mm').format(date);
  }
}
