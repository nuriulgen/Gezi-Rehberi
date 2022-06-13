import 'package:flutter/material.dart';

class CircleIcon extends StatelessWidget {
  final IconData circleIcon;
  final String text;
  final VoidCallback? onPressed;
  const CircleIcon(
      {Key? key, required this.circleIcon, required this.text, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.blue.shade300,
          radius: 30,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 29,
            child: IconButton(
              onPressed: onPressed,
              icon: Icon(circleIcon, color: Colors.blue),
              iconSize: 25,
            ),
          ),
        ),
        SizedBox(height: 5),
        Text(
          text,
          style: TextStyle(
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
