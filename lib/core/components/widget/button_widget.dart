import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final double? radius;
  final ButtonStyle? style;
  final VoidCallback onPressed;
  final Widget? child;

  const ElevatedButtonWidget({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color,
    this.fontSize,
    this.style,
    this.child, this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: style ??
            ElevatedButton.styleFrom(
              primary: color ?? Color(0xFF3949AB),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius ?? 25)),
            ),
        child: child ??
            Text(
              text,
              style: TextStyle(
                  color: color ?? Colors.white, fontSize: fontSize ?? 25),
            ),
        onPressed: onPressed,
      );
}
