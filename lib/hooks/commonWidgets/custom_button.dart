import 'package:caringio_student/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton({
    super.key,
    required this.text,
    required this.onpress,
    this.width = double.infinity,
    this.height = 20,
    this.color = kTextWhite,
  });

  final Widget text;
  final Function() onpress;
  final double width;
  final double height;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: color,
      minWidth: width,
      onPressed: onpress,
      child: text,
      height: height,
    );
  }
}

//Gradient button
class GradientButton extends StatelessWidget {
  const GradientButton({
    super.key,
    required this.text,
    required this.onpress,
    this.width,
    this.height,
    this.color = kTextWhite,
  });

  final Widget text;
  final Function() onpress;
  final double? width;
  final double? height;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Container(
        width: width,
        height: height ?? 32.h,
        decoration: BoxDecoration(
          gradient: gradientAppbar,
          borderRadius: BorderRadius.circular(8.0),
          color: color,
        ),
        child: Center(child: text),
      ),
    );
  }
}
