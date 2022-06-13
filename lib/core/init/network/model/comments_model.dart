import 'dart:convert';

List<Comments> commentsFromMap(String str) =>
    List<Comments>.from(json.decode(str).map((x) => Comments.fromMap(x)));

String commentsToMap(List<Comments> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Comments {
  Comments({
    required this.id,
    required this.user,
    required this.visitPlace,
    required this.content,
    required this.createdAt,
  });

  int id;
  String user;
  String visitPlace;
  String content;
  String createdAt;

  factory Comments.fromMap(Map<String, dynamic> json) => Comments(
        id: json["id"],
        user: json["user"],
        visitPlace: json["visitPlace"],
        content: json["content"],
        createdAt: json["createdAt"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "user": user,
        "visitPlace": visitPlace,
        "content": content,
        "createdAt": createdAt,
      };
}
