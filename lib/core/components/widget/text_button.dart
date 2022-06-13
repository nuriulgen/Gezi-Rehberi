import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final ButtonStyle? style;
  final VoidCallback onPressed;
  const TextButtonWidget(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.color,
      this.fontSize,
      this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize ?? 15,
          color: color ?? Colors.black,
        ),
      ),
      style: style ?? ButtonStyle(),
    );
  }
}
