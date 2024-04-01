class SchedulePreviewModel {
  final int id;
  final String scheduleDate;
  final String? scheduleText;
  final String petName;

  SchedulePreviewModel({
    required this.id,
    required this.scheduleDate,
    required this.scheduleText,
    required this.petName,
  });

  factory SchedulePreviewModel.fromJson(Map<String, dynamic> json) {
    return SchedulePreviewModel(
      id: json['id'],
      scheduleDate: json['scheduleDate'],
      scheduleText: json['scheduleText'],
      petName: json['petName'],
    );
  }
}
