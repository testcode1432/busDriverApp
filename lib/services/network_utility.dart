import 'dart:convert';
import 'dart:developer';

import 'package:caringio_student/View/logIn/login_screen.dart';
import 'package:caringio_student/constants.dart';
import 'package:caringio_student/hooks/api_controller.dart';
import 'package:caringio_student/hooks/user_controller.dart';
import 'package:caringio_student/model/api/api_response_model.dart';
import 'package:caringio_student/model/userInfo/user_info_model.dart';
import 'package:caringio_student/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../View/refresh_screen/refresh_screen.dart';
import '../hooks/commonWidgets/snackbar.dart';

const int timeoutSeconds = 60;
int trycall = 0;

class NetworkUtility {
  static getRequest(Uri uri, {Map<String, String>? headers}) async {
    try {
      final response = await http
          .get(uri, headers: headers)
          .timeout(const Duration(seconds: timeoutSeconds), onTimeout: () {
        return http.Response('Timeout Error!!', 408);
      });
      if (response.statusCode == 200) {
        return response;
        // ApiResponse(
        //     statusCode: response.statusCode, body: jsonDecode(response.body));
      } else if (response.statusCode == 403) {
        getSnackbar(
            discription: 'somthing went wrong..! ',
            titile: 'Error 403',
            bgColor: ktextred);
        return ApiResponse(
            statusCode: response.statusCode, body: {"message": "error 403"});
      } else if (response.statusCode == 500) {
        log('Tried calling ${trycall.toString()} times');
        // getSnackbar(
        //     discription: 'somthing went wrong..! ',
        //     titile: 'Error 500',
        //     bgColor: ktextred);
        if (trycall == 0) {
          trycall++;
          bool isSuccess = await NetworkUtility.refreshTheToken();
          if (isSuccess) {
            trycall = 0;
            Get.toNamed(RefreshScreen.routeName);
          } else {
            trycall++;
          }
        }

        return ApiResponse(
            statusCode: response.statusCode, body: {"message": "error 500"});
      } else if (response.statusCode == 400) {
        getSnackbar(
            discription: response.body ?? 'somthing went wrong..! ',
            titile: 'Error 400',
            bgColor: ktextred);
        // refreshToken();
        return ApiResponse(
            statusCode: response.statusCode,
            body: {"message": response.body.toString()});
      } else if (response.statusCode == 408) {
        getSnackbar(
            discription: 'somthing went wrong..! ',
            titile: 'Error 408',
            bgColor: ktextred);
        return ApiResponse(
            statusCode: response.statusCode, body: {"message": "error 408"});
      } else {
        getSnackbar(
            discription: 'somthing went wrong..! ',
            titile: 'Error ${response.statusCode} ',
            bgColor: ktextred);
        return ApiResponse(
            statusCode: response.statusCode, body: jsonDecode(response.body));
      }
    } catch (err) {
      debugPrint('$failed Exeption @ $uri ______> ${err.toString()}');
    }
  }

  static Future<ApiResponse?> postRequest(
      Uri uri, Map<String, String>? headers, Map<String, dynamic>? data) async {
    try {
      // await Future.delayed(const Duration(seconds: 2));
      // print(data);
      final response = await http
          .post(uri, headers: headers, body: jsonEncode(data))
          .timeout(const Duration(seconds: timeoutSeconds), onTimeout: () {
        return http.Response('Timeout Error!!', 408);
      });
      if (response.statusCode == 200) {
        return ApiResponse(
            statusCode: response.statusCode, body: jsonDecode(response.body));
      }
      if (response.statusCode == 408) {
        return ApiResponse(
            statusCode: response.statusCode, body: {"message": "error 408"});
      }
      if (response.statusCode == 403) {
        return ApiResponse(
            statusCode: response.statusCode, body: {"message": "error 403"});
      }

      return ApiResponse(statusCode: response.statusCode, body: {
        "message":
            "error code-->${response.statusCode} body-->${response.body.toString()}"
      });
      // statusCode: response.statusCode, body: jsonDecode(response.body));
    } catch (err) {
      debugPrint(err.toString());
    }
  }

  static postWithResponseReturn(
      Uri uri, Map<String, String>? headers, Map<String, dynamic>? data) async {
    try {
      // await Future.delayed(const Duration(seconds: 2));
      // print(data);
      final response = await http
          .post(uri, headers: headers, body: jsonEncode(data))
          .timeout(const Duration(seconds: timeoutSeconds), onTimeout: () {
        return http.Response('Timeout Error!!', 408);
      });
      if (response.statusCode == 200) {
        return response;
      }
      if (response.statusCode == 408) {
        return ApiResponse(
            statusCode: response.statusCode, body: {"message": "error 408"});
      }
      if (response.statusCode == 403) {
        return ApiResponse(
            statusCode: response.statusCode, body: {"message": "error 403"});
      }

      return ApiResponse(statusCode: response.statusCode, body: {
        "message":
            "error code-->${response.statusCode} body-->${response.body.toString()}"
      });
      // statusCode: response.statusCode, body: jsonDecode(response.body));
    } catch (err) {
      debugPrint(err.toString());
    }
    return null;
  }

  static Future<ApiResponse?> putRequest(
      Uri uri, Map<String, String>? headers, Map<String, dynamic>? data) async {
    try {
      // await Future.delayed(const Duration(seconds: 2));
      final response = await http
          .put(uri, headers: headers, body: jsonEncode(data))
          .timeout(const Duration(seconds: timeoutSeconds), onTimeout: () {
        return http.Response('Timeout Error!!', 408);
      });

      if (response.statusCode == 408) {
        return ApiResponse(
            statusCode: response.statusCode, body: {"message": response.body});
      }

      return ApiResponse(
          statusCode: response.statusCode, body: jsonDecode(response.body));
    } catch (err) {
      debugPrint(err.toString());
    }
    return null;
  }

  static Future<ApiResponse?> patchRequest(
      Uri uri, Map<String, String>? headers, Map<String, dynamic>? data) async {
    try {
      // await Future.delayed(const Duration(seconds: 2));
      final response = await http
          .patch(uri, headers: headers, body: jsonEncode(data))
          .timeout(const Duration(seconds: timeoutSeconds), onTimeout: () {
        return http.Response('Timeout Error!!', 408);
      });

      if (response.statusCode == 408) {
        return ApiResponse(
            statusCode: response.statusCode, body: {"message": response.body});
      }

      return ApiResponse(
          statusCode: response.statusCode, body: jsonDecode(response.body));
    } catch (err) {
      debugPrint(err.toString());
    }
    return null;
  }

  static Future<ApiResponse?> deleteRequestById(Uri uri) async {
    try {
      // await Future.delayed(const Duration(seconds: 2));
      final response = await http
          .delete(uri, headers: await authHeaders())
          .timeout(const Duration(seconds: timeoutSeconds), onTimeout: () {
        return http.Response('Timeout Error!!', 408);
      });

      if (response.statusCode == 408) {
        return ApiResponse(
            statusCode: response.statusCode, body: {"message": response.body});
      }

      return ApiResponse(
          statusCode: response.statusCode, body: jsonDecode(response.body));
    } catch (err) {
      debugPrint(err.toString());
    }
    return null;
  }

  static Future<ApiResponse?> deleteRequestWithoutId(Uri uri) async {
    try {
      // await Future.delayed(const Duration(seconds: 2));
      final response = await http
          .delete(uri, headers: await authHeaders())
          .timeout(const Duration(seconds: timeoutSeconds), onTimeout: () {
        return http.Response('Timeout Error!!', 408);
      });

      if (response.statusCode == 408) {
        return ApiResponse(
            statusCode: response.statusCode, body: {"message": response.body});
      }

      return ApiResponse(
          statusCode: response.statusCode, body: jsonDecode(response.body));
    } catch (err) {
      debugPrint(err.toString());
    }
    return null;
  }

  // static Future<http.StreamedResponse> uploadImage(Uri uri, File? data) async {
  //   var userData = await getUserData();
  //   http.MultipartRequest request = http.MultipartRequest('POST', uri);

  //   request.headers.addAll(<String, String>{
  //     "Content-type": "multipart/form-data",
  //     "Authorization": "Bearer ${userData.token}"
  //   });

  //   if (GetPlatform.isMobile && data != null) {
  //     File file = File(data.path);

  //     request.files.add(http.MultipartFile('user_profile_image',
  //         file.readAsBytes().asStream(), file.lengthSync(),
  //         filename: file.path.split('/').last,
  //         contentType: MediaType('image', 'png')));
  //   }

  //   http.StreamedResponse response = await request.send();
  //   return response;
  // }

  // static Future<http.StreamedResponse> uploadAddressImage(
  //     Uri uri, File? data) async {
  //   var userData = await getUserData();
  //   http.MultipartRequest request = http.MultipartRequest('POST', uri);

  //   request.headers.addAll(<String, String>{
  //     "Content-type": "multipart/form-data",
  //     "Authorization": "Bearer ${userData.token}"
  //   });

  //   if (GetPlatform.isMobile && data != null) {
  //     File file = File(data.path);

  //     request.files.add(http.MultipartFile(
  //         'address_image', file.readAsBytes().asStream(), file.lengthSync(),
  //         filename: file.path.split('/').last,
  //         contentType: MediaType('image', 'png')));
  //   }

  //   http.StreamedResponse response = await request.send();
  //   return response;
  // }

  static setHeaders() =>
      {"Accept": "application/json", "Content-Type": "application/json"};

  static authHeaders() async {
    const storage = FlutterSecureStorage();
    var token = await storage.read(key: "token");

    if (token != null) {
      return {
        "Accept": "*/*",
        'Content-Type': 'application/json',
        "Authorization": "Bearer $token"
      };
    } else {
      return {'Accept': '*/*', 'Content-Type': 'application/json'};
    }
  }

  static authHeaders2() async {
    UserInfoModal? userinfo = await NetworkUtility.getuserInfo();
    // const storage = FlutterSecureStorage();
    // var token = await storage.read(key: "token");
    // log(userinfo!.token.toString());

    if (userinfo!.token != null) {
      return {"Accept": "*/*", "Authorization": "Bearer ${userinfo.token}"};
    } else {
      return {'Accept': '*/*', 'Content-Type': 'application/json'};
    }
  }

  static getStudentId() async => getuserInfo().then(
      (userinfo) => userinfo != null ? userinfo.userName : 'student id null');

  static Future<String> getAuthToken() async => getuserInfo().then((userinfo) =>
      userinfo != null ? 'Bearer ${userinfo.token}' : 'token null');

  // static getAuthToken() async =>
  //     await const FlutterSecureStorage().read(key: "token");

  static authHeadersWithScoolId() async {
    const storage = FlutterSecureStorage();
    var token = await storage.read(key: "token");
    String schoolId = await UserController.schoolId();
    log(token.toString());

    if (token != null) {
      return {'Accept': '*/*', 'schoolId': schoolId, 'Authorization': token};
    } else {
      return {'Accept': '*/*', 'Content-Type': 'application/json'};
    }
  }

//header for dashboard (curent user data)
  static Future<Map<String, String>> authHeadersWithuserID() async {
    final UserInfoModal? userInfoModal = await getuserInfo();
    final token = userInfoModal?.token;
    final email = userInfoModal?.userName;
    return {
      'Accept': '*/*',
      'email': email ?? '',
      'Authorization': 'Bearer $token'
    };
  }

//get user info for all barear token and usernames
  static Future<UserInfoModal?> getuserInfo() async {
    const storage = FlutterSecureStorage();
    final jsonString = await storage.read(key: "userinfo");

    if (jsonString != null) {
      final jsonData = json.decode(jsonString);
      log("Current token ${jsonData["token"]}");
      return UserInfoModal(
        userName: jsonData["username"],
        token: jsonData["token"],
        refreshToken: jsonData["refreshToken"] ?? 'refreshToken_was_null',
      );
    }
  }

  //delete token(Log out)
  static deleteUserInfo() async {
    const storage = FlutterSecureStorage();
    await storage.delete(key: "userinfo");
  }

  //remove shared prefarance
  static removesharedPrif() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("isToken");
    prefs.reload();
  }

  static Future<bool> refreshTheToken() async {
    final userinfo = await getuserInfo();

    if (userinfo != null) {
      String oldRefreshToken = userinfo.refreshToken;

      // DialogHelper.showLoading();

      try {
        // final header = {"token": refreshToken};
        debugPrint(oldRefreshToken);
        final response = await NetworkUtility.getRequest(
          Uri.parse(ApiController.refreshToken),
          headers: {"token": oldRefreshToken},
        );
        if (response != null) {
          if (response?.statusCode == 200) {
            const storage = FlutterSecureStorage();
            log(response.body.toString());
            final jsonData = jsonDecode(response.body);
            final token = jsonData["token"];
            final refreshToken = jsonData["refreshToken"];

            // final token = response.body["token"];
            // final refreshToken = response.body["refreshToken"].toString();

            final newUserinfo = UserInfoModal(
              userName: userinfo.userName,
              token: token,
              refreshToken: refreshToken,
            );
            final jsonEncoded = json.encode(newUserinfo.toJson());
            await storage.write(key: "userinfo", value: jsonEncoded);
            debugPrint('$success refreshToken ');
            // Get.toNamed(RefreshScreen.routeName);
            // Get.defaultDialog(
            //     title: 'Session Expired',
            //     middleText: 'Please refresh the page',
            //     actions: [
            //       ElevatedButton(
            //         style: ElevatedButton.styleFrom(
            //           padding: const EdgeInsets.symmetric(
            //               horizontal: 50, vertical: 10),
            //           shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(20),
            //           ),
            //         ),
            //         onPressed: () async {
            //           Get.back();

            //           Get.offAllNamed(LoginScreen.routeName);
            //           // Get.offNamedUntil(
            //           //     '/your_route', (route) => route.isFirst);
            //         },
            //         child: const Text(
            //           'Refresh',
            //           style: TextStyle(fontSize: 24),
            //         ),
            //       ),
            //     ]);
            return true;
          } else if (response?.statusCode == 400) {
            Get.defaultDialog(
                title: 'Session Expired',
                middleText: 'Please login again',
                actions: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () async {
                      await NetworkUtility.deleteUserInfo();
                      await UserController.deleteUserData();
                      await NetworkUtility.removesharedPrif();

                      Get.offAllNamed(LoginScreen.routeName);
                    },
                    child: const Text(
                      'Logout',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ]);
            return false;
          } else {
            debugPrint(
                '$failed refreshToken , ${response.statusCode.toString()} - ${response.body.toString()}');
            // DialogHelper.hideDialog();
            return false;
          }
        } else {
          debugPrint(
              '$failed refreshToken , response null   ${response.toString()}');
          return false;
        }
      } catch (e) {
        debugPrint('$failed Exception caught on refreshToken ,$e');
        return false;
      }
    } else {
      return false;
    }
  }
}
