import 'package:caringio_student/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArrowWidget extends StatelessWidget {
  const ArrowWidget({
    super.key,
    required this.onpress,
    required this.iconData,
  });
  final Function() onpress;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Icon(
          iconData,
          color: kTextBlack,
          size: 24.w,
        ),
      ),
    );
  }
}
