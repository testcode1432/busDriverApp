// ignore_for_file: constant_identifier_names

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:caringio_student/hooks/commonWidgets/snackbar.dart';
import 'package:caringio_student/hooks/enums.dart';
import 'package:caringio_student/hooks/user_controller.dart';
import 'package:caringio_student/model/event/event_model.dart';
import 'package:caringio_student/model/event/news_event_model.dart';
import 'package:caringio_student/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../model/subject/subject_model.dart';
import '../../services/network_utility.dart';
import '../api_controller.dart';

class CommonFunction {


//For fetching school news
  static Future<List<NewsModel>> getSchoolNews(
      {required EventType eventType}) async {
    log("GET---> holidays fetching");
    String schoolId = await UserController.schoolId();
    String? token = await NetworkUtility.getAuthToken();
    String eventTypeString = eventType.toString().split('.').last;
    // List<EventModel> eventList = [];
    List<NewsModel> newsLIst = [];
    var header = {
      'accept': '*/*',
      'schoolId': schoolId,
      'eventType': eventTypeString,
      'Authorization': token
    };

    final response = await NetworkUtility.getRequest(
        Uri.parse(ApiController.getAllSchoolEventsBySchoolIdAndEventType),
        headers: header);
    log(response.toString());
    if (response != null) {
      if (response.statusCode == 200) {
        log('200 respose');

        // if respose is list []

        var decodedJson = (json.decode(response.body));
        for (var element in decodedJson) {
          newsLIst.add(NewsModel.fromJson(element));
        }

        log('event added to eventList -->$newsLIst');
        return newsLIst;
      } else {
        log('respose code not 200');
        return newsLIst;
      }
    } else {
      log('respose null');
      return newsLIst;
    }
  }
}

Future<File?> pickImageFromGallery() async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: ImageSource.gallery);

  if (pickedFile != null) {
    log(pickedFile.path);
    return File(pickedFile.path);
  } else {
    return null;
  }
}

Future<File?> captureImageFromCamera() async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: ImageSource.camera);

  if (pickedFile != null) {
    // The pickedFile variable contains the image file captured from the camera.
    // You can process and use it as needed.
    return File(pickedFile.path);
  } else {
    // If the user canceled the camera operation, return null.
    return null;
  }
}

String formatDate(String? date) {
  if (date == null) {
    return 'Date';
  } else {
    DateFormat inputFormat = DateFormat('yyyy-MM-dd');
    DateFormat outputFormat = DateFormat('d MMMM yyyy');
    DateTime dateTime = inputFormat.parse(date);
    return outputFormat.format(dateTime);
  }
}

String formatDate2(String? inputDate) {
  try {
    if (inputDate == null) {
      return 'Invalid date';
    }

    List<String> parts = inputDate.split('.');
    String pre = parts.first; // date without milliseconds
    String post = parts.last.split('+').last; // offset
    String formatted = "${pre}+${post}"; // formatted string

    DateTime parsedDate = DateTime.parse(formatted); // Parsing the input date

    final DateFormat format = DateFormat("d MMMM yyyy"); // Format you want

    String finalDate =
        format.format(parsedDate); // Getting your date in your format

    return finalDate;
  } catch (e) {
    log('Invalid date - $inputDate  exeption $e');
    return 'Invalid date';
  }
}

String getDayOrMonth({
  String? dateString,
  bool returnDay = true,
  int? month,
}) {
  if (dateString == null) {
    if (month != null) {
      if (month < 1 || month > 12) {
        throw ArgumentError('Invalid month number');
      }

      DateTime date = DateTime(DateTime.now().year, month);
      String monthName = DateFormat('MMMM').format(date);

      return monthName;
    } else {
      return 'No date';
    }
  } else {
    DateFormat inputFormat = DateFormat('yyyy-MM-dd');
    DateTime date = inputFormat.parse(dateString);

    if (returnDay) {
      return DateFormat('dd').format(date);
    } else {
      return DateFormat('MMMM').format(date);
    }
  }
}

String formatTime(String time) {
  return time.substring(0, 5);
}

somethingWentWrong({String errorCode = ''}) {
  getSnackbar(
      titile: 'Something went wrong',
      discription:
          "Please contact authorities, ${errorCode.isNotEmpty ? 'code-$errorCode ' : ''}  ",
      bgColor: Colors.red);
}

///Time ago
/*
  input : inputs a string eg '2020-11-01 11:58:05'
  output : outputs a year ago, 1 minutes ago etc..  eg:7 months ago

 */

String displayTimeAgoFromTimestamp(String? dateString,
    {bool numericDates = false}) {
  if (dateString == null) {
    return 'Time not available!';
  }
  DateTime? date = DateTime.tryParse(dateString);
  if (date == null) {
    return 'Time not available!';
  }
  final date2 = DateTime.now();
  final difference = date2.difference(date);

  if ((difference.inDays / 365).floor() >= 2) {
    return '${(difference.inDays / 365).floor()} years ago';
  } else if ((difference.inDays / 365).floor() >= 1) {
    return (numericDates) ? '1 year ago' : 'Last year';
  } else if ((difference.inDays / 30).floor() >= 2) {
    return '${(difference.inDays / 30).floor()} months ago';
  } else if ((difference.inDays / 30).floor() >= 1) {
    return (numericDates) ? '1 month ago' : 'Last month';
  } else if ((difference.inDays / 7).floor() >= 2) {
    return '${(difference.inDays / 7).floor()} weeks ago';
  } else if ((difference.inDays / 7).floor() >= 1) {
    return (numericDates) ? '1 week ago' : 'Last week';
  } else if (difference.inDays >= 2) {
    return '${difference.inDays} days ago';
  } else if (difference.inDays >= 1) {
    return (numericDates) ? '1 day ago' : 'Yesterday';
  } else if (difference.inHours >= 2) {
    return '${difference.inHours} hours ago';
  } else if (difference.inHours >= 1) {
    return (numericDates) ? '1 hour ago' : 'An hour ago';
  } else if (difference.inMinutes >= 2) {
    return '${difference.inMinutes} minutes ago';
  } else if (difference.inMinutes >= 1) {
    return (numericDates) ? '1 minute ago' : 'A minute ago';
  } else if (difference.inSeconds >= 3) {
    return '${difference.inSeconds} seconds ago';
  } else {
    return 'Just now';
  }
}

List<String> extractLinksFromText(String linksString) {
  if (String == "Not available") {
    return [];
  }
  // Split the string using ","
  List<String> linksList = linksString.split(',');

  // Trim each link to remove leading and trailing whitespaces
  linksList = linksList.map((link) => link.trim()).toList();

  return linksList;
}
