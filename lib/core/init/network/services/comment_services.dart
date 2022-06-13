import 'package:flutter/material.dart';

import '../../../components/card_comments.dart';
import '../../../constants/app_constants.dart';
import '../http_service.dart';
import '../model/comments_model.dart';

class CommentServices extends StatefulWidget {
  const CommentServices({Key? key}) : super(key: key);

  @override
  _CommentServicesState createState() => _CommentServicesState();
}

class _CommentServicesState extends State<CommentServices> {
  final HttpService httpService = HttpService();
  final AppConstant url = AppConstant();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: httpService.getComments(url.urlComments),
      builder: (BuildContext context, AsyncSnapshot<List<Comments>> snapshot) {
        if (snapshot.hasData) {
          var postList = snapshot.data!;
          if (postList.isEmpty) {
            return Center(child: Text('Henüz yorum yapmadınız...'));
          } else {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: postList.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: CardComments(
                      name: postList[index].user,
                      date: postList[index].createdAt,
                      comment: postList[index].content,
                      logo: postList[index].id.toString(),
                    ),
                  );
                });
          }
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
