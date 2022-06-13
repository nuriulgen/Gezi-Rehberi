import 'dart:convert';

List<Post> postFromMap(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromMap(x)));

String postToMap(List<Post> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Post {
  Post({
    required this.id,
    required this.visitPlace,
    required this.yesCount,
    required this.noCount,
    required this.createdAt,
  });

  int id;
  String visitPlace;
  int yesCount;
  int noCount;
  String createdAt;

  factory Post.fromMap(Map<String, dynamic> json) => Post(
        id: json["id"],
        visitPlace: json["visitPlace"],
        yesCount: json["yesCount"],
        noCount: json["noCount"],
        createdAt: json["createdAt"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "visitPlace": visitPlace,
        "yesCount": yesCount,
        "noCount": noCount,
        "createdAt": createdAt,
      };
}
