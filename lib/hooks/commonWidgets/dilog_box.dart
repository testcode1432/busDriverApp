
import 'package:app_settings/app_settings.dart';
import 'package:caringio_student/constants.dart';
import 'package:caringio_student/hooks/commonWidgets/common_text.dart';
import 'package:caringio_student/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

getCustomDilog(
    {required String title,
    required String discription,
    required String status,
    required String assignedDate,
    required String submitionDate,
    required BuildContext context}) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            // title: CommonTextBlack(
            //   text: title,
            //   textSize: 20,
            //   weight: FontWeight.bold,
            // ),

            content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                kwidth10,
                CommonTextBlack(
                  text: title,
                  weight: FontWeight.bold,
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: SvgPicture.asset(
                    closeSvg,
                    color: ktextYellow,
                  ),
                )
              ],
            ),
            kheight10,
            CommonTextBlack(
              text: "DETAILS:",
              color: ktextGrey2,
              textSize: 13.sp,
            ),
            CommonTextBlack(
              text: discription,
              textSize: 12.sp,
            )
          ],
        ));
      });
}

showLogoutAlert({required BuildContext context, required Function() ontap}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          CupertinoDialogAction(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
          ),
          CupertinoDialogAction(
            child: const Text('Logout'),
            onPressed: ontap,
            isDestructiveAction: true,
          ),
        ],
      );
    },
  );
}



Future<bool> openLocationAlwaysPermissionPrompt(BuildContext context) async {
  bool returnBoolType = false;
  Get.defaultDialog(
      backgroundColor: Colors.white,
      title: "Location permission",
      content: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          child: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'This app requires you to ALL TIME LOCATION permission. This helps us to:',
                ),
                SizedBox(height: 20),
                Text(''),
                SizedBox(height: 20),
                Text('Do you want to update location settings?'),
              ],
            ),
          ),
        ),
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              style: const ButtonStyle(
              ),
              onPressed: () {
                returnBoolType =false;
                Navigator.pop(context); // Close the dialog
              },
              child: const Text('Deny', style: TextStyle(color: Colors.red)),
            ),
            TextButton(
              style: const ButtonStyle(),
              onPressed: () async {
                await AppSettings.openAppSettings(
                    type: AppSettingsType.location);
                Get.back();
                returnBoolType = true;
              },
              child: const Text('Update settings', style: TextStyle(color: Colors.green),),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        )
      ],
      barrierDismissible: false);
  return returnBoolType;
}

