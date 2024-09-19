import 'package:caringio_student/constants.dart';
import 'package:caringio_student/hooks/commonWidgets/common_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAvathar extends StatelessWidget {
  const CustomAvathar(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.onpress,
      this.fontsize,
      this.rightPadding,
      this.leftPadding});
  final String imageUrl;
  final String title;
  final double? fontsize;
  final Function() onpress;
  final double? rightPadding;
  final double? leftPadding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: leftPadding ?? 16.w,
          right: rightPadding ?? 26.w,
          top: 24.h,
          bottom: 19.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: onpress,
            child: CircleAvatar(
              radius: 34.r,
              backgroundColor: kPageyellow,
              child: CircleAvatar(
                backgroundColor: kTextWhite,
                radius: 32.r,
                child: SvgPicture.asset(
                  imageUrl,
                  width: 36.76.w,
                  height: 34.h,
                ),
              ),
            ),
          ),
          kheight8,
          CommonTextBlack(
            text: title,
            textSize: fontsize ?? 10.sp,
            weight: FontWeight.w800,
          )
        ],
      ),
    );
  }
}
