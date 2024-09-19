import 'dart:developer';

import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServies {
  jwtDecode(String token) {
    Map<String, dynamic> payload = Jwt.parseJwt(token);
    String userRole = payload["role"];
    log(userRole);
    return userRole;
  }
}

Future<bool> isUserLoggedIn() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  bool keycontain = prefs.containsKey("isToken");

  if (keycontain) {
    await Future.delayed(const Duration(seconds: 7));
    return true;
  } else {
    log("false  wokesssss");
    await Future.delayed(const Duration(seconds: 7));
    return false;
  }
}
