import 'package:caringio_student/constants.dart';
import 'package:flutter/material.dart';

class ShadowContainer extends StatelessWidget {
  const ShadowContainer({
    super.key,
    required this.mwidth,
    required this.childwidget,
  });

  final double mwidth;
  final Widget childwidget;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        width: mwidth - 20,
        decoration: BoxDecoration(
            color: kTextWhite,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5.0,
              ),
            ]),
        child: childwidget);
  }
}

class ShadowContainer2 extends StatelessWidget {
  const ShadowContainer2({
    super.key,
    required this.childwidget,
    required this.width,
    this.height,
    this.margin,
    this.borderRadius = 10,
    this.padding,
  });

  final double width;
  final double? height;
  final Widget childwidget;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double borderRadius;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: margin,
        height: height,
        width: width,
        padding: padding,
        decoration: BoxDecoration(
            color: kTextWhite,
            borderRadius: BorderRadius.circular(borderRadius),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5.0,
              ),
            ]),
        child: childwidget);
  }
}
