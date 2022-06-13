import 'package:flutter/material.dart';

import '../../core/components/widget/appBar_widget.dart';
import '../../core/init/network/services/follow_services.dart';

class FollowingsPage extends StatefulWidget {
  const FollowingsPage({Key? key}) : super(key: key);

  @override
  _FollowingsPageState createState() => _FollowingsPageState();
}

class _FollowingsPageState extends State<FollowingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'Takip Edilenler'),
      body: ListView(
        children: [
          FollowService(),
        ],
      ),
    );
  }
}
