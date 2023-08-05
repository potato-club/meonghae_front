class PostCommentModel {
  final int id;
  final String comment;
  final String date;
  final bool isWriter;
  final String? profileUrl;
  final int replies;
  final bool update;

  PostCommentModel({
    required this.id,
    required this.comment,
    required this.date,
    required this.isWriter,
    this.profileUrl,
    required this.replies,
    required this.update,
  });

  factory PostCommentModel.fromJson(Map<String, dynamic> json) {
    return PostCommentModel(
      id: json['id'],
      comment: json['comment'],
      date: json['date'],
      isWriter: json['isWriter'],
      profileUrl: json['profileUrl'],
      replies: json['replies'],
      update: json['update'],
    );
  }
}
