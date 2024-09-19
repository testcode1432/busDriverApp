import 'dart:convert';

import 'package:caringio_student/View/bottomNavPage/bottem_nav.dart';
import 'package:caringio_student/View/logIn/services/auth_services.dart';
import 'package:caringio_student/constants.dart';
import 'package:caringio_student/hooks/api_controller.dart';
import 'package:caringio_student/hooks/commonWidgets/snackbar.dart';
import 'package:caringio_student/hooks/dilog_helper.dart';
import 'package:caringio_student/model/userInfo/user_info_model.dart';
import 'package:caringio_student/services/network_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogInServices {
  userLogin({
    required String email,
    required String password,
  }) async {
    DialogHelper.showLoading();
    final response = await NetworkUtility.postRequest(
        Uri.parse(ApiController.loginUrl),
        NetworkUtility.setHeaders(),
        {"email": email, "password": password});

    if (response!.statusCode == 200) {
      const storage = FlutterSecureStorage();
      // final jsonData = jsonDecode(response.body.toString()) as Map;
      final jsonData = response.body;
      final token = jsonData["token"];
      final refreshToken = jsonData["refreshToken"];
      // final token = response.body["token"];
      final userinfo = UserInfoModal(
        userName: email,
        token: token,
        refreshToken: refreshToken,
      );
      final jsonEncoded = json.encode(userinfo.toJson());
      await storage.write(key: "userinfo", value: jsonEncoded);
      final userRole = await AuthServies().jwtDecode(token);
      DialogHelper.hideDialog();
      if (userRole == "BUS_DRIVER") {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("isToken", "true");
        Get.toNamed(BottomNavScreen.routeName);
      } else {
        getSnackbar(
            bgColor: ktextred,
            titile: "Failed",
            discription: "invalid user name and password");
        debugPrint("Invalid user name and password");
      }
    } else {
      DialogHelper.hideDialog();
      getSnackbar(
          bgColor: ktextred,
          titile: "Failed",
          discription: "invalid user name and password");
    }
  }
}
