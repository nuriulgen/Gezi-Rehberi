import 'package:flutter/material.dart';

class FollowList extends StatefulWidget {
  final String name;
  final String surName;
  final String photoPath;
  final int? followings;
  final int? followers;

  final TextButton? button;
  final Widget? child;

  const FollowList({
    Key? key,
    required this.name,
    required this.surName,
    required this.photoPath,
    this.button,
    this.child,
    this.followings,
    this.followers,
  }) : super(key: key);

  @override
  State<FollowList> createState() => _FollowListState();
}

class _FollowListState extends State<FollowList> {
  bool isFollowing = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(6.0),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                widget.photoPath,
              ),
              radius: 23,
            ),
            title: Text(
              widget.name + " " + widget.surName,
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
              ),
            ),
            trailing: Container(
              width: 120,
              child: TextButton(
                  onPressed: () {
                    setState(() {
                      isFollowing = !isFollowing;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: isFollowing ? Color(0xFF3949AB) : Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22)),
                  ),
                  child: isFollowing
                      ? Text("Takipi Bırak",
                          style: TextStyle(
                            color: Colors.white,
                          ))
                      : Text("Takip Et",
                          style: TextStyle(
                            color: Colors.white,
                          ))),
            ),
          ),
        ),
      ),
    );
  }
}
