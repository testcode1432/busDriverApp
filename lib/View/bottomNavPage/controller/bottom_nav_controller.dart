import 'dart:convert';
import 'dart:developer';

import 'package:caringio_student/View/logIn/login_screen.dart';
import 'package:caringio_student/hooks/api_controller.dart';
import 'package:caringio_student/hooks/functions/upload_file.dart';
import 'package:caringio_student/hooks/user_controller.dart';
import 'package:caringio_student/model/dashboard/dashboard_model.dart';
import 'package:caringio_student/model/userInfo/school_features_model.dart';
import 'package:caringio_student/model/userInfo/user_info_model.dart';
import 'package:caringio_student/services/network_utility.dart';
import 'package:caringio_student/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class BottomNavController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isStartRide = false.obs;
  DashBoradModel? dashBoradModel;



  @override
  void onInit() {
    getRideStatus();
    super.onInit();
  }


  getRideStatus()async{
    final prefs = await SharedPreferences.getInstance();
    isStartRide.value  = await prefs.getBool("rideActiveStatus") ?? false;
  }

  getdata() async {
    isLoading.value = true;
    dashBoradModel = await getUserData();
    isLoading.value = false;
  }


  Future<bool> startRide()async{
    final prefs = await SharedPreferences.getInstance();
    try{
      await prefs.setBool("rideActiveStatus", true);
      return true;
    }catch(e){
      return false;
    }

  }

  Future<bool> stopRide()async{
    final prefs = await SharedPreferences.getInstance();
    try{
      await prefs.setBool("rideActiveStatus", false);
      return true;
    }catch(e){
      return false;
    }

  }


  Future<DashBoradModel?> getUserData() async {
    final response = await NetworkUtility.getRequest(
      Uri.parse(ApiController.getUserBasicInfoByEmail),
      headers: await NetworkUtility.authHeadersWithuserID(),
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body.toString());
      dashBoradModel = DashBoradModel.fromJson(json);


      debugPrint('$success authHeadersWithuserID');
      // isNavScreen500.value = false;
    } else if (response.statusCode == 500) {
      // isNavScreen500.value = true;
      // forceLogout(context);
    } else {
      // isNavScreen500.value = false;
      debugPrint("$failed authHeadersWithuserID ${response.statusCode}");
    }
    // isNavScreen500.value = false;
    return dashBoradModel;
  }


  Future<DashBoradModel?> sentLocation() async {
    final response = await NetworkUtility.getRequest(
      Uri.parse(ApiController.getUserBasicInfoByEmail),
      headers: await NetworkUtility.authHeadersWithuserID(),
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body.toString());
      dashBoradModel = DashBoradModel.fromJson(json);


      debugPrint('$success authHeadersWithuserID');
      // isNavScreen500.value = false;
    } else if (response.statusCode == 500) {
      // isNavScreen500.value = true;
      // forceLogout(context);
    } else {
      // isNavScreen500.value = false;
      debugPrint("$failed authHeadersWithuserID ${response.statusCode}");
    }
    // isNavScreen500.value = false;
    return dashBoradModel;
  }

  void forceLogout(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Logout"),
          content: const Text("Session expired logging out?"),
          actions: <Widget>[
            TextButton(
              child: const Text("Logout"),
              onPressed: () async {
                await NetworkUtility.deleteUserInfo();
                await UserController.deleteUserData();
                await NetworkUtility.removesharedPrif();
                // Navigator.of(context).pop();
                // Get.back();
                Get.offAllNamed(LoginScreen.routeName);
              },
            ),
          ],
        );
      },
    );
  }

  updateProfilePhoto(BuildContext context) async {
    // DialogHelper.showLoading();
    await UploadFiles.startUploadingImage(context: context, path: "profileUrl");
    isLoading.value = true;
    await getdata();
    isLoading.value = false;
  }
}
