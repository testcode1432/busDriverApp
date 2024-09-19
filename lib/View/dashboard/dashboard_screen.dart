import 'package:caringio_student/View/announcements/announcement_screen.dart';
import 'package:caringio_student/View/bottomNavPage/controller/bottom_nav_controller.dart';
import 'package:caringio_student/View/dashboard/components/body.dart';
import 'package:caringio_student/View/dashboard/components/body.dart';
import 'package:caringio_student/View/dashboard/components/dashboard_appbar.dart';
import 'package:caringio_student/View/refresh_screen/refresh_screen.dart';
import 'package:caringio_student/constants.dart';
import 'package:caringio_student/hooks/commonWidgets/common_appbar.dart';
import 'package:caringio_student/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl.dart';

import 'components/service_disabled.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key? key}) : super(key: key);
  static String routeName = "/dashboard_screen";
  final BottomNavController _controller = Get.find<BottomNavController>();

  @override
  Widget build(BuildContext context) {
    String cdate = DateFormat("yyyy-MM-dd").format(DateTime.now());
    final mheight = MediaQuery.of(context).size.height;
    //   final mwidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: gradientAppBar(
            continerhHeight: mheight * 0.50,
            prefferdHeight: mheight * 0.18,
            leadingonpress: () {
              scaffoldKey.currentState?.openDrawer();
            },
            leadingWidget: const Icon(
              Icons.menu,
              color: kTextWhite,
              size: 24,
            ),
            trailingonpress: () {
              Get.toNamed(AnnouncementScreen.routeName);
            },
            trailingWidget: SvgPicture.asset(notificationSvg),
            text: "DashBoard",
            centerAppbarWidget: Obx(
              () => (_controller.isLoading.value ||
                      _controller.dashBoradModel == null)
                  ? const SizedBox()
                  : DashBoardAppbarWidget(
                      controller: _controller, cdate: cdate),
            )),
        body: Obx(() {
          if (_controller.isLoading.value == true) {
            return const Center(child: CircularProgressIndicator());
          } else if (_controller.dashBoradModel == null) {
            return const ServiceDisabledContainer();
            // return const RefreshScreen();
          } else {
            return const DashBoardBody();
          }
        }));
  }
}
