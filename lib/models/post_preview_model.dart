class PostPreviewModel {
  int? id;
  String? title;
  String? type;
  int? likes;
  int? commentSize;
  bool? image;

  PostPreviewModel({
    this.id,
    this.title,
    this.type,
    this.likes,
    this.commentSize,
    this.image,
  });

  factory PostPreviewModel.fromJson(Map<String, dynamic> json) {
    return PostPreviewModel(
      id: json['id'],
      title: json['title'],
      type: json['type'],
      likes: json['likes'],
      commentSize: json['commentSize'],
      image: json['image'],
    );
  }
}
