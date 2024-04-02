class SchedulePreviewModel {
  final int id;
  final String scheduleDate;
  final String? scheduleTitle;
  final String petName;

  SchedulePreviewModel({
    required this.id,
    required this.scheduleDate,
    required this.scheduleTitle,
    required this.petName,
  });

  factory SchedulePreviewModel.fromJson(Map<String, dynamic> json) {
    return SchedulePreviewModel(
      id: json['id'],
      scheduleDate: json['scheduleDate'],
      scheduleTitle: json['scheduleTitle'],
      petName: json['petName'],
    );
  }
}
