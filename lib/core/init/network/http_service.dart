import 'dart:convert';

import 'package:http/http.dart';

import 'model/comments_model.dart';
import 'model/users_model.dart';
import 'model/visit_places.dart';
import 'model/voting_visit_places_model.dart';

class HttpService {
  Future<List<Post>> getPosts(String url) async {
    var response = await get(Uri.parse(url),
        headers: {"Content-type": "application/json"});
    if (response.statusCode == 200) {
      List<dynamic> jsonBody = jsonDecode(response.body);
      List<Post> posts =
          jsonBody.map((dynamic item) => Post.fromMap(item)).toList();
      return posts;
    } else {
      throw Exception('Request failed with status: ${response.statusCode}');
    }
  }

  Future<List<Comments>> getComments(String url) async {
    var response = await get(Uri.parse(url),
        headers: {"Content-type": "application/json"});
    if (response.statusCode == 200) {
      List<dynamic> jsonBody = jsonDecode(response.body);
      List<Comments> result =
          jsonBody.map((dynamic item) => Comments.fromMap(item)).toList();
      print(result);
      print(response.body);
      return result;
    } else {
      throw Exception('Request failed with status: ${response.statusCode}');
    }
  }

  Future<List<VisitPlaces>> getVisitPlaces(String url) async {
    var response = await get(Uri.parse(url),
        headers: {"Content-type": "application/json"});
    if (response.statusCode == 200) {
      List<dynamic> jsonBody = jsonDecode(response.body);
      List<VisitPlaces> result =
          jsonBody.map((dynamic item) => VisitPlaces.fromMap(item)).toList();

      return result;
    } else {
      throw Exception('Request failed with status: ${response.statusCode}');
    }
  }

  Future<List<UserModel>> getUser(String url) async {
    var response = await get(Uri.parse(url),
        headers: {"Content-type": "application/json"});
    if (response.statusCode == 200) {
      List<dynamic> jsonBody = jsonDecode(response.body);
      List<UserModel> result =
          jsonBody.map((dynamic item) => UserModel.fromMap(item)).toList();
      return result;
    } else {
      throw Exception('Request failed with status: ${response.statusCode}');
    }
  }
}
