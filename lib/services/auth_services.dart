


//get user info for all barear token and usernames
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../model/userInfo/user_info_model.dart';

Future<UserInfoModal?> getuserInfo() async {
  const storage = FlutterSecureStorage();
  final jsonString = await storage.read(key: "userinfo");

  if (jsonString != null) {
    final jsonData = json.decode(jsonString);
    debugPrint("Token - ${jsonData["token"]}");
    debugPrint("refreshToken - ${jsonData["refreshToken"]}");
    debugPrint("schoolId - ${jsonData["schoolId"]}");
    debugPrint("username - ${jsonData["username"]}");
    return UserInfoModal(
      userName: jsonData["username"],
      refreshToken: jsonData["refreshToken"],
      token: jsonData["token"],
    );
  }
  return null;
}