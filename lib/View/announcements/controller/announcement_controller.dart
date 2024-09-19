import 'dart:convert';
import 'dart:developer';

import 'package:caringio_student/hooks/user_controller.dart';
import 'package:get/get.dart';

import '../../../hooks/api_controller.dart';

import '../../../services/network_utility.dart';
import '../model/announcement_model.dart';

class AnnouncementController extends GetxController {
  var announcementList = <AnnouncementModel>[].obs;
  var isloading = false.obs;
  getAllAnnouncements() async {
    String schoolId = await UserController.schoolId();

    String token = await NetworkUtility.getAuthToken();
    var header = {
      // 'Accept': '*/*',
      'Authorization': token,
      'schoolId': schoolId
    };

    isloading.value = true;
    final response = await NetworkUtility.getRequest(
        Uri.parse(ApiController.getAllAnnouncementsBySchoolId),
        headers: header);
    log(response.toString());
    if (response != null) {
      if (response.statusCode == 200) {
        announcementList.clear();
        log(' respose code 200');
        var decodedJson = (json.decode(response.body));
        for (var achievement in decodedJson) {
          announcementList.add(AnnouncementModel.fromJson(achievement));
        }
        // announcementList.value = (response as List).map((e) {
        //   return AnnouncementModel.fromJson(e);
        // }).toList();
        log('value added to announcementList ');
        isloading.value = false;
      } else {
        log('respose code not 200');
        isloading.value = false;
      }
    } else {
      log('respose null');
      isloading.value = false;
    }
  }
}
