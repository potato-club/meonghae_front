class CalendarFormModel {
  int? petId;
  String? text;
  DateTime alarmTime;
  String? cycle;
  int? cycleCount;
  String? cycleType;
  bool hasRepeat;
  DateTime scheduleTime;
  String? scheduleType;

  CalendarFormModel(
      {required this.petId,
      required this.text,
      required this.alarmTime,
      required this.cycle,
      required this.cycleCount,
      required this.cycleType,
      required this.hasRepeat,
      required this.scheduleTime,
      required this.scheduleType});
}
