import 'package:caringio_student/View/bottomNavPage/controller/bottom_nav_controller.dart';
import 'package:caringio_student/View/profile/components/details_column.dart';
import 'package:caringio_student/constants.dart';
import 'package:caringio_student/hooks/commonWidgets/circle_avathar.dart';
import 'package:caringio_student/hooks/commonWidgets/common_appbar.dart';
import 'package:caringio_student/hooks/commonWidgets/common_text.dart';
import 'package:caringio_student/hooks/commonWidgets/custom_button.dart';
import 'package:caringio_student/hooks/functions/upload_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  static String routeName = "/profile_screen";

  final BottomNavController _controller = Get.put(BottomNavController());
  @override
  Widget build(BuildContext context) {
    // String imagepath ="";
    return Scaffold(
      appBar: gradientAppBar(
        leadingonpress: () {
          Get.back();
        },
        leadingWidget: const Icon(
          Icons.arrow_back,
          color: kTextWhite,
          size: 25,
        ),
        text: "Profile",
        continerhHeight: 180,
        prefferdHeight: 230,
        bottomWidget: Align(
          alignment: Alignment.bottomCenter,
          child: NetworkCircleAvathar(
            circleRadius: 80,
            height: 110.r,
            width: 110.r,
            photoUrl: _controller.dashBoradModel!.photoUrl ?? "",
            borderRadius: 90,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: GradientButton(
                  width: 150.w,
                  text: CommonTextBlack(
                      text: "Edit Photo",
                      textSize: 15.sp,
                      weight: FontWeight.bold),
                  onpress: () async {
                    UploadFiles.startUploadingImage(
                        context: context, path: "profileUrl");
                    //  _showImagePickerBottomSheet(context);
                  },
                ),
              ),
              DetailsColumn(
                keytext: "Driver Full Name",
                valueText:
                    " ${_controller.dashBoradModel?.firstName ?? ""}  ${_controller.dashBoradModel?.middleName}  ${_controller.dashBoradModel?.lastName} ",
              ),
              const Divider(),
              DetailsColumn(
                keytext: "Phone Number",
                valueText: _controller.dashBoradModel?.phoneNo ?? "",
              ),
              const Divider(),
              DetailsColumn(
                keytext: "School’s Name",
                valueText: _controller.dashBoradModel?.schoolName ?? "",
              ),
              const Divider(),
              DetailsColumn(
                keytext: "School’s Id",
                valueText: _controller.dashBoradModel?.schoolId ?? "",
                // valueText: _controller.dashBoradModel!.email,
              ),

              const Divider(),
              const DetailsColumn(
                keytext: "Bus Number",
                valueText:
                    "...",
              ),
              const Divider(),
              DetailsColumn(
                keytext: "School Contact",
                valueText: _controller.dashBoradModel?.schoolId ?? "",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
