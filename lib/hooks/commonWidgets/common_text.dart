import 'package:caringio_student/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonTextSmall extends StatelessWidget {
  const CommonTextSmall(
      {super.key,
      required this.text,
      this.textSize = 20,
      this.weight = FontWeight.w700,
      this.color = kTextWhite});
  final String text;
  final double textSize;
  final FontWeight weight;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: textSize,
        fontFamily: defaultFount,
        fontWeight: weight,
        color: color,
      ),
    );
  }
}

//Big text black
class CommonTextBlack extends StatelessWidget {
  const CommonTextBlack(
      {super.key,
      required this.text,
      this.textSize = 20,
      this.textAlign,
      this.weight = FontWeight.w500,
      this.color = kTextBlack,
      this.lineHeight,
      this.overflow,
      this.maxLine});
  final String text;
  final double textSize;
  final FontWeight weight;
  final TextAlign? textAlign;
  final Color color;
  final double? lineHeight;
  final TextOverflow? overflow;
  final int? maxLine;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLine,
      style: TextStyle(
        height: lineHeight ?? 1.h,
        fontSize: textSize.sp,
        fontFamily: defaultFount,
        fontWeight: weight,
        color: color,
      ),
    );
  }
}

//Bold text
class BoldTextBlack extends StatelessWidget {
  const BoldTextBlack(
      {super.key,
      required this.text,
      this.textSize,
      this.weight = FontWeight.w700,
      this.color = kTextBlack});
  final String text;
  final double? textSize;
  final FontWeight weight;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: textSize ?? 16.sp,
        fontFamily: defaultFount,
        fontWeight: weight,
        color: color,
      ),
    );
  }
}

class NormalTextBlack extends StatelessWidget {
  const NormalTextBlack(
      {super.key,
      required this.text,
      this.textSize,
      this.weight = FontWeight.w500,
      this.color = kTextBlack});
  final String text;
  final double? textSize;
  final FontWeight weight;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: textSize ?? 14.sp,
        fontFamily: defaultFount,
        fontWeight: weight,
        color: color,
      ),
    );
  }
}

class ItaliCTextGrey extends StatelessWidget {
  const ItaliCTextGrey(
      {super.key,
      required this.text,
      this.textSize = 20,
      this.weight = FontWeight.w500,
      this.color = ktextGrey});
  final String text;
  final double textSize;
  final FontWeight weight;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontStyle: FontStyle.italic,
        fontSize: textSize,
        fontFamily: defaultFount,
        fontWeight: weight,
        color: color,
      ),
    );
  }
}
