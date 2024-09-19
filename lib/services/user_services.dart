
import 'package:background_location/background_location.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

import 'package:permission_handler/permission_handler.dart';
import '../hooks/api_controller.dart';
import '../model/userInfo/update_user_location.dart';
import '../model/userInfo/update_user_model.dart';
import '../strings.dart';
import 'auth_services.dart';
import 'network_utility.dart';

class UserContollerService {
  static updauser(UpadateUserModel userModel) async {
    bool status = false;
    try {
      final userInfo = await getuserInfo();

      final body = {
        "firstName": userModel.firstName,
        "middleName": userModel.middleName,
        "lastName": userModel.lastName,
        "email": userInfo?.userName,
        "phoneNo": userModel.phoneNumer
      };

      final headers = {
        'Authorization': 'Bearer ${userInfo?.token}',
        'Content-Type': 'application/json',
        'accept': '*/*',
      };

      if (userInfo != null) {
        // final response = await NetworkUtility.putRequest(
        //   Uri.parse(ApiController.updaetUserProfileUrl),
        //   headers,
        //   body,
        // );
        // if (response?.statusCode == 200) {
        //   status = true;
        // } else {
        //   debugPrint(
        //       "updateuserProfile error..........${response?.statusCode}");
        // }
      }
      return status;
    } catch (e) {
      debugPrint("$e updateuserProfile error..........");
      return status;
    }
  }

  static resetPassword(
      {required String email,
      required String otp,
      required String newpassword}) async {
    bool status = false;
    try {
      final body = {"email": email, "newPassword": newpassword, "otp": otp};
      final headers = {
        'Content-Type': 'application/json',
        'accept': '*/*',
      };
      final response = await NetworkUtility.postRequest(
        Uri.parse(ApiController.resetPassword),
        headers,
        body,
      );
      if (response?.statusCode == 200) {
        debugPrint(
            "$success Password reset (resetPassword) ${response?.statusCode}");
        status = true;
      } else {
        debugPrint(
            "$failed Password reset (resetPassword) ${response?.statusCode}");
      }
      return status;
    } catch (e) {
      // debugPrint(
      //     "$failed Exception when Password reset (resetPassword) ___ $e");
      return status;
    }
  }

  static updatePassword(
      {required String email,
      required String oldPassword,
      required String newPassword}) async {
    bool status = false;
    try {
      final body = {
        "email": email,
        "newPassword": newPassword,
        "oldPassword": oldPassword
      };
      final headers = {
        'Content-Type': 'application/json',
        'accept': '*/*',
      };
      // final response = await NetworkUtility.putRequest(
      //   Uri.parse(ApiController.updatePassword),
      //   headers,
      //   body,
      // );
      // if (response?.statusCode == 200) {
      //   debugPrint(
      //       "$success Password reset (updatePassword) ${response?.statusCode}");
      //   status = true;
      // } else {
      //   debugPrint(
      //       "$failed Password reset (updatePassword) ${response?.statusCode}");
      // }
      return status;
    } catch (e) {
      // debugPrint(
      //     "$failed Exception when Password reset (updatePassword) ___ $e");
      return status;
    }
  }

  static generateResetOtp({required String email}) async {
    String status = "";
    try {
      final headers = {
        'Content-Type': 'application/json',
        'accept': '*/*',
        'email': email
      };
      final http.Response response = await http
          .get(Uri.parse(ApiController.generateResetOtp), headers: headers);
      if (response.statusCode == 200) {
        status = "Otp Sent successfully";
      } else if (response.body == "No value present") {
        status = "User not found";
      } else {
        status = "Unknown error occured";
      }
      return status;
     } catch (e) {
    //   debugPrint(
    //       "$failed Exception when Password reset (generateResetOtp) ___ $e");
      return "Unknown error occured";
    }
  }



  static updateUserLocation(
      {required UserLocationForm locationForm}) async {
    bool status = false;
    try {
      final body = {
        "creationTime": locationForm.creationTime,
        "updationTime": locationForm.updationTime,
        "createdBy": locationForm.createdBy,
        "updatedBy": locationForm.updatedBy,
        "busRegistrationNumber": locationForm.busRegistrationNumber,
        "currentLongitude": locationForm.currentLongitude,
        "currentLatitude": locationForm.currentLatitude,
        "lastLatitude": locationForm.lastLatitude,
        "lastLongitude": locationForm.lastLongitude
      };
      final headers = {
        'Content-Type': 'application/json',
        'accept': '*/*',
      };
      final response = await NetworkUtility.putRequest(
        Uri.parse(ApiController.updateLocation),
        headers,
        body,
      );
      if (response?.statusCode == 200) {
        debugPrint(
            "$success location save ${response?.statusCode}");
        status = true;
      } else {
        debugPrint(
            "$failed location save fail ${response?.statusCode}");
      }
      return status;
    } catch (e) {
      // debugPrint(
      //     "$failed Exception when Password reset (resetPassword) ___ $e");
      return status;
    }
  }



  static getLocation() async{
    var newLiveLocationLatitude;
    var oldLiveLocationLatitude;
    // print("Called location request=================");
    PermissionStatus status = await Permission.location.status;
    PermissionStatus locationAlwaysStatus = await Permission.locationAlways.status;
    Position position= await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    oldLiveLocationLatitude = position.latitude;
    //print("When app open Location =================>>> $position");

    await BackgroundLocation.setAndroidNotification(
      title: 'Background service is running',
      message: 'Your Location: $position',
      icon: '@mipmap/ic_launcher',
    );
    //await BackgroundLocation.setAndroidConfiguration(1000);
    await BackgroundLocation.startLocationService(
        distanceFilter: 20);
    BackgroundLocation.getLocationUpdates((location){
      // print("When App minimize location =--------------------------> $location");
      oldLiveLocationLatitude = location.latitude;
      if(location !=null && location !={}){
        position = location as Position;
      }

    });

      newLiveLocationLatitude =oldLiveLocationLatitude;
     // String? deviceUUid = await const AndroidId().getId();
      UserLocationForm locationForm = UserLocationForm(
        creationTime: "",
        updationTime: "",
        createdBy: "",
        updatedBy: "",
        busRegistrationNumber: "",
        currentLongitude: "",
        currentLatitude: "",
        lastLongitude: "",
        lastLatitude: ""
      );
updateUserLocation(locationForm: locationForm);


  }
}
