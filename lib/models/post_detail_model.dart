class PostDetailModel {
  final int id;
  final String title;
  final String content;
  final String date;
  final String? profileUrl;
  final List<dynamic>? images;
  final int commentSize;
  final bool writer;
  bool likeStatus;
  int likes;

  PostDetailModel({
    required this.id,
    required this.title,
    required this.content,
    required this.date,
    this.profileUrl,
    this.images,
    required this.commentSize,
    required this.likeStatus,
    required this.likes,
    required this.writer,
  });

  factory PostDetailModel.fromJson(Map<String, dynamic> json) {
    return PostDetailModel(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      date: json['date'],
      profileUrl: json['profileUrl'],
      images: json['images'],
      commentSize: json['commentSize'],
      likeStatus: json['likeStatus'],
      likes: json['likes'],
      writer: json['writer'],
    );
  }
}
