// ignore_for_file: unused_field

import 'package:flutter/foundation.dart';

class ApiController {
  //all urls

  static const String _defaultEndpoint = "https://host.caringio.in/api/v1";

  static const String _devEndpoint = "$_defaultEndpoint";
  static const String _prodEndpoint = "$_defaultEndpoint";

  static const String _endPoint = kReleaseMode ? _prodEndpoint : _devEndpoint;
  static const String refreshToken = "$_defaultEndpoint/auth/refreshToken";
  static const String loginUrl = "$_defaultEndpoint/auth/busCrewLogin";
  static const String generateResetOtp = "$_defaultEndpoint/user/generateResetOtp";
  static const String resetPassword = "$_defaultEndpoint/user/resetPassword";
  static const String updateLocation = "$_defaultEndpoint/busLocation/updateBusLocation";
  static const String getAllSchoolEventsBySchoolIdAndEventType =
      "$_endPoint/schoolEvent/getAllSchoolEventsBySchoolIdAndEventType";
  static const String generatePresignedPutURL =
      "$_endPoint/s3/generatePresignedPutURL";
  static const String getAllAnnouncementsBySchoolId =
      "$_endPoint/announcement/getAllAnnouncementsBySchoolId";
  static const String getUserBasicInfoByEmail =
      "$_endPoint/user/getUserBasicInfoByEmail";
  static const String getClassId = "$_endPoint/classesInfo/getClassId";
  static const String updateUserUrl = "$_defaultEndpoint/user/updateUser";



}
