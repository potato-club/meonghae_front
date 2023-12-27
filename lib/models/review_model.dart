class ReviewModel {
  final int id;
  final String title;
  final String content;
  final String date;
  final int likes;
  final int dislikes;
  final List<dynamic>? images;
  final String nickname;
  final String? profileUrl;
  final int rating;
  final String? recommendStatus;
  final bool writer;

  ReviewModel({
    required this.id,
    required this.title,
    required this.content,
    required this.date,
    required this.likes,
    required this.dislikes,
    this.images,
    required this.nickname,
    this.profileUrl,
    required this.rating,
    this.recommendStatus,
    required this.writer,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      date: json['date'],
      likes: json['likes'],
      dislikes: json['dislikes'],
      images: json['images'],
      nickname: json['nickname'],
      profileUrl: json['profileUrl'],
      rating: json['rating'],
      recommendStatus: json['recommendStatus'],
      writer: json['writer'],
    );
  }
}
