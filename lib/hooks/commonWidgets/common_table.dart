import 'package:caringio_student/constants.dart';
import 'package:caringio_student/hooks/commonWidgets/common_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MultyGradientTable extends StatelessWidget {
   MultyGradientTable({
    super.key,
    required this.dummydata,
    required this.index,
    required this.iscolorRed,
  });

  var dummydata;
  final int index;
  final bool iscolorRed;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: index.isEven
            ? const LinearGradient(
                colors: [kGradientyellow, kGradientwhite],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )
            : const LinearGradient(
                colors: [kGradientyellow2, kGradientwhite2],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CommonTextSmall(
              text: dummydata[index].subjectName,
              color: kTextBlack,
              weight: FontWeight.w400,
              textSize: 12.sp,
            ),
            CommonTextSmall(
              textSize: 12.sp,
              weight: FontWeight.w800,
              text: "${dummydata[index].marksScored}",
              color: iscolorRed ? ktextred : kTextBlack,
            ),
          ],
        ),
      ),
    );
  }
}
