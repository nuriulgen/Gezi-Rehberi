import 'package:flutter/material.dart';

class FavoriteListTile extends StatelessWidget {
  final IconData? icon;
  final String title;
  final VoidCallback? onPressed;

  const FavoriteListTile({
    Key? key,
    this.icon,
    required this.title,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.blue,
        size: 35,
      ),
      title: RichText(
        text: TextSpan(
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
          children: [
            TextSpan(text: title),
          ],
        ),
      ),
    );
  }
}
