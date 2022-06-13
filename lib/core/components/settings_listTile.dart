import 'package:flutter/material.dart';

class SettingsListTile extends StatelessWidget {
  final IconData? icon;
  final String title;
  final VoidCallback? onPressed;

  const SettingsListTile({
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
        color: Colors.grey.shade600,
        size: 30,
      ),
      title: RichText(
        text: TextSpan(
          style: TextStyle(
            color: Colors.grey.shade600,
          ),
          children: [
            TextSpan(text: title),
          ],
        ),
      ),
      trailing: IconButton(
        onPressed: onPressed,
        icon: Icon(Icons.arrow_forward_ios, color: Colors.black),
      ),
    );
  }
}
