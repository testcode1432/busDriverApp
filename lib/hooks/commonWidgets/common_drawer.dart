
import 'package:caringio_student/View/bottomNavPage/controller/bottom_nav_controller.dart';
import 'package:caringio_student/View/logIn/login_screen.dart';
import 'package:caringio_student/View/privacy_policy/privacy_policy_webview.dart';
import 'package:caringio_student/View/privacy_policy/terms_and_condition_webview.dart';
import 'package:caringio_student/View/profile/profile_screen.dart';
import 'package:caringio_student/constants.dart';
import 'package:caringio_student/hooks/commonWidgets/circle_avathar.dart';
import 'package:caringio_student/hooks/commonWidgets/common_text.dart';
import 'package:caringio_student/hooks/commonWidgets/custom_button.dart';
import 'package:caringio_student/hooks/commonWidgets/dilog_box.dart';
import 'package:caringio_student/hooks/user_controller.dart';
import 'package:caringio_student/services/network_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({
    super.key,
  });
  final BottomNavController _controller = Get.put(BottomNavController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: gradientAppbar),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 28.h, bottom: 8.h),
                  child: NetworkCircleAvathar(
                    photoUrl: _controller.dashBoradModel!.photoUrl ?? "",
                  ),
                ),
                CommonTextBlack(
                    text: _controller.dashBoradModel!.firstName ?? "No name",
                    weight: FontWeight.bold),
                kheight20,
                CustomMaterialButton(
                    width: 98.w,
                    height: 32.h,
                    text: const CommonTextBlack(
                      text: "View Profile",
                      textSize: 12,
                      weight: FontWeight.w600,
                    ),
                    onpress: () {
                      Get.toNamed(ProfileScreen.routeName);
                    }),
                kheight20
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: defaltPadding,
              children: [
                DrawerTile(
                  imageUrl: "assets/png/privacypolicy.png",
                  onpress: () async{
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                TermsAndConditionWebView()));
                  },
                  title: "T&C",
                ),
                DrawerTile(
                  imageUrl: "assets/svg/privacypolicy.svg",
                  onpress: () async{
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PrivacyPolicyWebView()));
                  },
                  title: "PrivacyPolicy",
                ),
                DrawerTile(
                  imageUrl: "assets/svg/logout.svg",
                  onpress: () {
                    Get.back();
                    showLogoutAlert(
                        context: context,
                        ontap: () async {
                          await NetworkUtility.deleteUserInfo();
                          await UserController.deleteUserData();
                          await NetworkUtility.removesharedPrif();
                          Get.offAllNamed(LoginScreen.routeName);
                        });
                  },
                  title: "Log Out",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DrawerTile extends StatelessWidget {
  const DrawerTile({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.onpress,
  });
  final String imageUrl;
  final String title;
  final Function() onpress;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onpress,
      leading: SvgPicture.asset(
        imageUrl,
        width: 20,
        height: 20,
      ),
      title: CommonTextBlack(
        textSize: 15,
        text: title,
        weight: FontWeight.w600,
      ),
    );
  }
}
