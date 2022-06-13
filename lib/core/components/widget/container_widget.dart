import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? color;
  final Decoration? decoration;
  final Widget? child;
  final double? radius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const ContainerWidget(
      {Key? key,
      this.height,
      this.width,
      this.color,
      this.decoration,
      this.child,
      this.padding,
      this.margin,
      this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      height: height ?? 50,
      width: width ?? 290,
      decoration: decoration ??
          BoxDecoration(
              color: color ?? Color(0xFF3949AB),
              borderRadius: BorderRadius.circular(radius ?? 30)),
      child: child,
    );
  }
}
