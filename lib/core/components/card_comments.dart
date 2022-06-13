import 'package:flutter/material.dart';

class CardComments extends StatefulWidget {
  final String logo;
  final Color? color;
  final Widget? child;
  final double? elevation;
  final double? radius;
  final Color? shadowColor;
  final String name;
  final String date;
  final String comment;

  CardComments({
    Key? key,
    this.elevation,
    this.shadowColor,
    this.color,
    this.child,
    required this.logo,
    required this.name,
    required this.date,
    required this.comment,
    this.radius,
  }) : super(key: key);

  @override
  State<CardComments> createState() => _CardCommentsState();
}

class _CardCommentsState extends State<CardComments> {
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(widget.radius ?? 10),
      elevation: widget.elevation ?? 5,
      shadowColor: widget.shadowColor ?? Colors.grey,
      color: widget.color ?? Colors.white,
      child: Column(
        children: [
          cardListTile(),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  ListTile cardListTile() {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(widget.logo),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.name,
            style: TextStyle(
              color: Colors.black,
              fontSize: 13,
            ),
          ),
          Text(
            widget.date,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 11,
            ),
          ),
        ],
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: RichText(
          text: TextSpan(
            style: TextStyle(
              color: Colors.grey.shade600,
            ),
            children: [
              TextSpan(text: widget.comment),
            ],
          ),
        ),
      ),
      contentPadding: EdgeInsets.only(
        top: 5,
        left: 5,
        right: 5,
      ),
    );
  }
}
