class PostModel {
  final int id;
  final String? profileUrl;
  final String title;
  final String content;
  final int likes;
  final int commentSize;
  final bool hasImage;
  final String date;

  PostModel({
    required this.id,
    this.profileUrl,
    required this.title,
    required this.content,
    required this.likes,
    required this.commentSize,
    required this.hasImage,
    required this.date,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      likes: json['likes'],
      commentSize: json['commentSize'],
      hasImage: json['hasImage'],
      date: json['date'],
      profileUrl: json['profileUrl'],
    );
  }
}
