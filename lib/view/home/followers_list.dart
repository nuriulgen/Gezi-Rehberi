import 'package:flutter/material.dart';

import '../../core/components/widget/appBar_widget.dart';
import '../../core/init/network/services/follow_services.dart';

class FollowersPage extends StatefulWidget {
  const FollowersPage({Key? key}) : super(key: key);

  @override
  _FollowersPageState createState() => _FollowersPageState();
}

class _FollowersPageState extends State<FollowersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'Takipçiler'),
      body: ListView(children: [
        FollowService(),
      ]),
    );
  }
}
