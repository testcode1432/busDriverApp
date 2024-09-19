import 'package:caringio_student/View/refresh_screen/refresh_screen.dart';
import 'package:caringio_student/View/startup/splash_screen.dart';
import 'package:caringio_student/constants.dart';
import 'package:caringio_student/hooks/commonWidgets/common_text.dart';
import 'package:caringio_student/hooks/commonWidgets/shadow_container.dart';
import 'package:caringio_student/services/network_utility.dart';
import 'package:caringio_student/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/channels.dart';
import '../../bottomNavPage/bottem_nav.dart';
import '../../bottomNavPage/controller/bottom_nav_controller.dart';

class ServiceDisabledContainer extends StatelessWidget {
  const ServiceDisabledContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final BottomNavController _controller = Get.put(BottomNavController());
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: InkWell(
            onTap: () {
              _controller.getdata();
              // restartApp();
              // Get.toNamed(SplashScreen.routeName);
              // NetworkUtility.refreshTheToken();
            },
            child: ShadowContainer2(
                padding: EdgeInsets.only(top: 40.h, bottom: 20),
                childwidget: Column(
                  children: [
                    SvgPicture.asset(serviceDisabledSvg),
                    kheight20,
                    CommonTextBlack(
                      text: "Service Disabled",
                      textSize: 24.sp,
                      color: ktextYellow,
                      weight: FontWeight.w800,
                    ),
                    kheight10,
                    CommonTextBlack(
                      text: "Contact school for help",
                      textSize: 16.sp,
                      weight: FontWeight.w600,
                    )
                  ],
                ),
                width: 0.90.sw),
          ),
        ),
      ],
    );
  }
}
