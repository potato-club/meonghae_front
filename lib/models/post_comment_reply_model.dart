class PostCommentReplyModel {
  final int id;
  final String comment;
  final String date;
  final bool isWriter;
  final String? profileUrl;
  final int parentId;
  final bool update;
  PostCommentReplyModel({
    required this.id,
    required this.comment,
    required this.date,
    required this.isWriter,
    this.profileUrl,
    required this.parentId,
    required this.update,
  });
  factory PostCommentReplyModel.fromJson(Map<String, dynamic> json) {
    return PostCommentReplyModel(
      id: json['id'],
      comment: json['comment'],
      date: json['date'],
      isWriter: json['isWriter'],
      profileUrl: json['profileUrl'],
      parentId: json['parentId'],
      update: json['update'],
    );
  }
}
