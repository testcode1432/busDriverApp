import 'package:caringio_student/View/bottomNavPage/controller/bottom_nav_controller.dart';
import 'package:caringio_student/constants.dart';
import 'package:caringio_student/hooks/commonWidgets/circle_avathar.dart';
import 'package:caringio_student/hooks/commonWidgets/common_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashBoardAppbarWidget extends StatelessWidget {
  const DashBoardAppbarWidget({
    super.key,
    required BottomNavController controller,
    required this.cdate,
  }) : _controller = controller;

  final BottomNavController _controller;
  final String cdate;

  @override
  Widget build(BuildContext context) {
    // log(_controller.dashBoradModel!.photoUrl.toString());
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          children: [
            kwidth10,
            NetworkCircleAvathar(
              photoUrl: _controller.dashBoradModel!.photoUrl ?? "",
            ),
            kwidth20,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonTextSmall(
                  text: _controller.dashBoradModel!.firstName ?? "No name",
                  textSize: 14.sp,
                ),
                kheight3,

              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CommonTextSmall(
              text: cdate,
              textSize: 11.sp,
            ),
            kwidth10
          ],
        ),
        kheight3
      ],
    );
  }
}
