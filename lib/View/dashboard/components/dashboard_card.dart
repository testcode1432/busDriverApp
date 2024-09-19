import 'package:caringio_student/constants.dart';
import 'package:caringio_student/hooks/commonWidgets/common_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardCard extends StatelessWidget {
  const DashboardCard({
    super.key,
    required this.time,
    required this.subject,
    required this.teacherName,
    // required this.status,
    required this.attantace,
    required this.endTime,
    required this.startTime,
  });
  final String time;
  final String subject;
  final String teacherName;
  // final String status;
  final String attantace;
  final String startTime;
  final String endTime;
  @override
  Widget build(BuildContext context) {
    String determineStatus(String startTime, String endTime) {
      DateTime now = DateTime.now();
      DateTime startDateTime = DateTime.parse("2024-01-19 $startTime");
      DateTime endDateTime = DateTime.parse("2024-01-19 $endTime");

      if (now.isBefore(startDateTime)) {
        return 'Upcoming';
      } else if (now.isBefore(endDateTime)) {
        return 'Ongoing';
      } else {
        return 'Completed';
      }
    }

    Color getStatusColor() {
      final String statusR = determineStatus(startTime, endTime);
      if (statusR == "Ongoing") {
        return ktextred;
      } else if (statusR == "Upcoming") {
        return ktextYellow;
      }

      return ktexGreen;
    }

    final Color statusColor = getStatusColor();
    return Container(
      //  height: 96.h,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: kPageyellow)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 14.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonTextBlack(
                text: time, textSize: 10.sp, weight: FontWeight.w400),
            kheight5,
            CommonTextBlack(
                text: subject, textSize: 12.sp, weight: FontWeight.bold),
            kheight3,
            CommonTextBlack(text: "Topic name", textSize: 8.sp),
            kheight9,
            CommonTextBlack(text: teacherName, textSize: 8.sp),
            kheight3,
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CommonTextBlack(
                  text: determineStatus(startTime, endTime),
                  textSize: 8,
                  weight: FontWeight.w700,
                  color: statusColor,
                ),
                kwidth5,
                const Icon(
                  Icons.circle,
                  size: 3,
                ),
                kwidth5,
                CommonTextBlack(
                    text: attantace,
                    color: ksuccesGreen,
                    weight: FontWeight.w700,
                    textSize: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
