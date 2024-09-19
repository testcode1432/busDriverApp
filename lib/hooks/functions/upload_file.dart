import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:caringio_student/hooks/commonWidgets/snackbar.dart';
import 'package:http/http.dart' as http;
import 'package:caringio_student/hooks/api_controller.dart';
import 'package:caringio_student/hooks/user_controller.dart';
import 'package:caringio_student/services/network_utility.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as p;
import '../../strings.dart';

class UploadFiles {
  File? pickedImage;
  static String? objectKey;
  //s3---------
  // static final s3 = S3(
  //     region: 'ap-south-1',
  //     credentials: AwsClientCredentials(
  //         accessKey: ApiController.accessKey,
  //         secretKey: ApiController.secretKey));
  //-----------

  static Future<File?> showChoiceDialog(BuildContext context) async {
    final XFile? pickedFile = await showModalBottomSheet<XFile?>(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  GestureDetector(
                    onTap: () async {
                      final XFile? pickedFile = await ImagePicker()
                          .pickImage(source: ImageSource.gallery);
                      Navigator.pop(context, pickedFile);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(Icons.photo_library),
                          ),
                          const Text('Gallery')
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                      height: 10), // Add a space between the containers
                  GestureDetector(
                    onTap: () async {
                      final XFile? pickedFile = await ImagePicker()
                          .pickImage(source: ImageSource.camera);
                      Navigator.pop(context, pickedFile);
                    },
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(Icons.photo_camera),
                        ),
                        const Text('Camera')
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );

    if (pickedFile != null) {
      return File(pickedFile.path);
    } else {
      return null;
    }
  }

  static updateUserProfile({required String profileUrl}) async {
    String token = await NetworkUtility.getAuthToken();
    String studentID = await NetworkUtility.getStudentId();

    debugPrint("Here is the token -> $token , here is the $studentID");
    var header = {
      'accept': '*/*',
      'Authorization': token,
      'Content-Type': 'application/json'
    };
    var body = {"email": studentID, "photoUrl": profileUrl};
    final response = await NetworkUtility.putRequest(
        Uri.parse(ApiController.updateUserUrl), header, body);
    if (response!.statusCode == 200) {
      debugPrint("Photo url updated on API");
      // getSnackbar(
      //     titile: "Photo Updated ",
      //     discription: "Profile photo updaed succesfully ");
    } else {
      debugPrint(
          "Something went worng on Photo url updated on API error code -> ${response.statusCode}");
    }
  }

  static Future<String?> getGeneratePresignedPutURL(
      {required String path}) async {
    String studentId = await UserController.studentId();
    String time = getCurrentTime();
    objectKey = '$studentId/$path-$time';
    // String _key = 'student123/profileUrl/13-10-2023-21-39';

    String token = await NetworkUtility.getAuthToken();

    debugPrint('object_key______>  $objectKey');

    var header = {
      'accept': '*/*',
      'objectKey': objectKey!,
      'Authorization': token
    };
    final response = await NetworkUtility.getRequest(
        Uri.parse(ApiController.generatePresignedPutURL),
        headers: header);
    if (response != null) {
      if (response.statusCode == 200) {
        debugPrint(
            '$success getGeneratePresignedPutURL code ${response.statusCode} ');

        return json.decode(response.body);
      } else {
        debugPrint(
            '$failed getGeneratePresignedPutURL _ code - ${response.statusCode}___> ${response.body} ');
        return null;
      }
    } else {
      debugPrint('$failed getGeneratePresignedPutURL response  null ');
      return null;
    }
  }

  static String getCurrentTime() {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('dd-MM-yyyy-HH-mm-ss-SSS');
    final String formatted = formatter.format(now);
    return formatted;
  }

/////----------------------Noramal http call-----------------

  static Future<void> uploadPhoto(File file, String preSignedUrl) async {
    try {
      String extention = getContentTypeFromExtension(file.path);
      debugPrint("extention -------> $extention");
      List<int> imageBytes = await file.readAsBytes();

      var response = await http.put(
        Uri.parse(preSignedUrl),
        body: imageBytes,
        headers: {
          'Content-Type': extention,
        },
      );

      if (response.statusCode == 200) {
        debugPrint('Photo uploaded successfully');
      } else {
        debugPrint(
            'Failed to upload photo with status code: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Exception at uploadPhoto: $e');
    }
  }

  // static void uploadImage(File file) async {
  //   try {
  //     // await api.createBucket(bucket: 'zumhprsag');
  //     await s3.putObject(
  //         bucket: 'zumhpr
  //     if (responce.body != null) {
  //       final newFile = File.fromRawPath(responce.body!);
  //       log(newFile.path);
  //     }

  //     s3.close();
  //     debugPrint(success);
  //     appendUrl(file.path);
  //   } catch (e) {
  //     debugPrint(e.toString());
  //   }
  // }

  static Future<bool> startUploadingImage(
      {required BuildContext context, required String path}) async {
    File? file;
    bool uplaodStatus = false;
    if (path == "profileUrl") {
      file = await showChoiceDialog(context);
    } else if (path == "document") {
      //file = await showFileselectionDilog(context);
    }
    if (file != null) {
      debugPrint(file.path.toString());
      uplaodStatus = await handleCommonUploadLogic(file: file, path: path);

      if (uplaodStatus == true && objectKey != null) {
        uplaodStatus = await updateUserProfile(profileUrl: objectKey!);
      }
    }
    return uplaodStatus;
  }

  static Future<bool> handleCommonUploadLogic(
      {required File file, required String path}) async {
    String? preSignedUrl;
    bool statusValue = false;
    try {
      preSignedUrl = await getGeneratePresignedPutURL(path: path);
      if (preSignedUrl != null) {
        statusValue = await uploadPhotoToAWS(file, preSignedUrl);
      } else {
        debugPrint("presigned Url null ");
        statusValue = false;
        return false;
      }
    } catch (e) {
      debugPrint('Exeption @ getPresigned Url  __> $e');
    }

    return statusValue;
  }

  static Future<bool> uploadPhotoToAWS(File file, String preSignedUrl) async {
    log("called ");
    bool status = false;
    try {
      String extention = getContentTypeFromExtension(file.path);
      debugPrint("extention -------> $extention");
      List<int> imageBytes = await file.readAsBytes();

      var response = await http.put(
        Uri.parse(preSignedUrl),
        body: imageBytes,
        headers: {
          'Content-Type': extention,
        },
      );

      if (response.statusCode == 200) {
        status = true;
        //log("upload completeee");
        debugPrint('Photo uploaded successfully');
      } else {
        status = false;
        //log("upload failed");
        debugPrint(
            'Failed to upload photo with status code: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Exception at uploadPhoto: $e');
    }
    return status;
  }

//get file extention (like .png ., .jpg , ........)
  static String getExtension(String filePath) {
    return p.extension(filePath); // returns '.png'
  }

//get content type
  static String getContentTypeFromExtension(String fileExtension) {
    String parcedContentType = getExtension(fileExtension);

    parcedContentType = parcedContentType.startsWith('.')
        ? parcedContentType.substring(1)
        : parcedContentType;
    debugPrint("parsed content typee -----> $parcedContentType");
    Map<String, String> contentTypeMap = {
      'jpg': 'image/jpeg',
      'jpeg': 'image/jpeg',
      'png': 'image/png',
      'gif': 'image/gif',
      // Add more extensions and content types as needed
    };

    // Get the content type based on the file extension
    return contentTypeMap[parcedContentType.toLowerCase()] ??
        'application/octet-stream';
  }

  static String appendUrl(String path) {
    const baseUrl = "";
    log(baseUrl + path);
    return baseUrl + path;
  }
}

//////Do not remove this code want to refer future

///////------------------safder code ------------------------
//     final responce = await s3.getObject(bucket: "zumhprsag", key: file.path);
//     // log(responce.body.toString());

// static Future<void> uploadPhoto(File file, String preSignedUrl) async {
//   try {
//     debugPrint(file.path);
//     debugPrint(preSignedUrl);
//     String extention = getExtension(file.path);

//     var request = http.MultipartRequest('PUT', Uri.parse(preSignedUrl));
//     request.files.add(await http.MultipartFile.fromPath('file', file.path,
//         contentType: MediaType('image', extention)));

//     var response = await request.send();

//     if (response.statusCode == 200) {
//       debugPrint('$success uploadPhoto_ Photo uploaded successfully');
//     } else {
//       debugPrint(
//           '$failed uploadPhoto_  Failed to upload photo with status code: ${response.statusCode}');
//     }
//   } catch (e) {
//     debugPrint('$failed  Exeption at uploadPhoto : $e');
//   }
// }

///---------------------------sufiyan code ----------------------
// static Future<void> uploadPhoto(File file, String preSignedUrl) async {
//   try {
//     debugPrint(file.path);
//     debugPrint(preSignedUrl);
//     String extension = getExtension(file.path);

//     var request = http.MultipartRequest('PUT', Uri.parse(preSignedUrl));
//     request.files.add(await http.MultipartFile.fromPath(
//       'file',
//       file.path,
//       contentType: MediaType('image', "jpeg"),
//     ));

//     var response = await request.send();

//     if (response.statusCode == 200) {
//       debugPrint('Photo uploaded successfully');
//     } else {
//       debugPrint(
//           'Failed to upload photo with status code: ${response.statusCode}');
//     }
//   } catch (e) {
//     debugPrint('Exception at uploadPhoto : $e');
//   }
// }
