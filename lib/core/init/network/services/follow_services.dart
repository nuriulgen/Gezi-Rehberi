import 'package:flutter/material.dart';

import '../../../components/widget/follow_list.dart';
import '../../../constants/app_constants.dart';
import '../http_service.dart';

class FollowService extends StatefulWidget {
  const FollowService({Key? key}) : super(key: key);

  @override
  State<FollowService> createState() => _FollowServiceState();
}

class _FollowServiceState extends State<FollowService> {
  final HttpService httpService = HttpService();
  final AppConstant url = AppConstant();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: httpService.getUser(url.urlUser),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          var result = snapshot.data!;
          return ListView.builder(
            shrinkWrap: true,
            itemCount: result.length,
            itemBuilder: (BuildContext context, int index) {
              return FollowList(
                photoPath: result[index].photoPath,
                surName: result[index].surname,
                name: result[index].name,
              );
            },
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
