import 'dart:convert';
import 'dart:developer';
import 'package:caringio_student/model/userInfo/user_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import '../services/network_utility.dart';
import 'api_controller.dart';

class UserController extends GetxController {
  static Rx<UserDataModel>? userData;

  static Future<String> studentId() async => NetworkUtility.getuserInfo().then(
      (userinfo) => userinfo != null ? userinfo.userName : 'studentId null');

  static Future<String> userName() async => 'student-1';

  static Future<String> classTeacherId() async =>
      getuserData().then((userdata) =>
          userdata != null ? userdata.classTeacherId : 'classTeacherId null');

  static Future<String> classId() async => getuserData().then((userdata) =>
      userdata != null ? userdata.classId : 'classTeacherId null');
  static Future<String> schoolId() async => getuserData().then(
      (userdata) => userdata != null ? userdata.schoolId : 'schoolId null');
  static Future<String> grade() async => getuserData()
      .then((userdata) => userdata != null ? userdata.grade : 'schoolId null');
  static Future<String> section() async => getuserData()
      .then((userdata) => userdata != null ? userdata.section : '-');

  static Future<String?> getClassId({
    required String schoolId,
    required String grade,
    required String section,
  }) async {
    String token = await NetworkUtility.getAuthToken();
    var header = {
      'accept': '*/*',
      'schoolId': schoolId,
      'grade': grade,
      'section': section,
      'Authorization': token
    };

    final response = await NetworkUtility.getRequest(
      Uri.parse(ApiController.getClassId),
      headers: header,
    );

    if (response.statusCode == 200) {
      debugPrint(response.body.toString());
      return response.body;
    } else {
      debugPrint(response.body.toString());
      return null;
    }
  }

  static Future<UserDataModel?> getuserData() async {
    const storage = FlutterSecureStorage();
    final jsonString = await storage.read(key: "userdata");

    if (jsonString != null) {
      final jsonData = json.decode(jsonString);
      UserDataModel dataModel = UserDataModel(
          classTeacherId: jsonData["classTeacherId"],
          section: jsonData["section"],
          schoolId: jsonData["schoolId"],
          grade: jsonData["grade"],
          classId: jsonData["classId"]);
      // userData = dataModel as Rx<UserDataModel>?;
      return dataModel;
    }
    return null;
  }

  static deleteUserData() async {
    const storage = FlutterSecureStorage();
    await storage.delete(key: "userdata");
  }

  static saveUserData({
    required String section,
    required String classTeacherId,
    required String grade,
    required String schoolId,
    required String classId,
  }) async {
    const storage = FlutterSecureStorage();

    final userinfo = UserDataModel(
      section: section,
      classTeacherId: classTeacherId,
      grade: grade,
      schoolId: schoolId,
      classId: classId,
    );
    final jsonEncoded = json.encode(userinfo.toJson());
    await storage.write(key: "userdata", value: jsonEncoded);
  }
}
