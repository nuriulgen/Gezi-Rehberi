import 'package:flutter/material.dart';

import '../../core/components/voting.dart';
import '../../core/constants/app_constants.dart';
import '../../core/init/network/http_service.dart';
import '../../core/init/network/model/voting_visit_places_model.dart';

class OylamaSayfasi extends StatefulWidget {
  const OylamaSayfasi({Key? key}) : super(key: key);

  @override
  _OylamaSayfasiState createState() => _OylamaSayfasiState();
}

class _OylamaSayfasiState extends State<OylamaSayfasi> {
  final HttpService httpService = HttpService();
  final AppConstant url = AppConstant();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Oylama',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: httpService.getPosts(url.urlVotingVisitPlaces),
        builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
          if (snapshot.hasData) {
            var postList = snapshot.data!;
            return ListView.builder(
                itemCount: postList.length,
                itemBuilder: (context, index) {
                  return Voting(
                    placeName: postList[index].visitPlace,
                    categoryName: postList[index].createdAt,
                  );
                });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
