import 'dart:convert';

List<UserModel> userModelFromMap(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromMap(x)));

String userModelToMap(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class UserModel {
  UserModel({
    required this.id,
    required this.name,
    required this.surname,
    required this.photoPath,
    required this.email,
    required this.userRole,
    required this.followings,
    required this.followers,
    required this.createdAt,
  });

  int id;
  String name;
  String surname;
  String photoPath;
  String email;
  String userRole;
  int followings;
  int followers;
  String createdAt;

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        surname: json["surname"],
        photoPath: json["photoPath"],
        email: json["email"],
        userRole: json["userRole"],
        followings: json["followings"],
        followers: json["followers"],
        createdAt: json["createdAt"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "surname": surname,
        "photoPath": photoPath,
        "email": email,
        "userRole": userRole,
        "followings": followings,
        "followers": followers,
        "createdAt": createdAt,
      };
}
