// import 'dart:io';

// import 'package:flutter/material.dart';

// class imageUpload {
//   static Future<bool> startUploading(
//       {required BuildContext context, required String path}) async {
//     File? file;
//     bool uplaodStatus = false;
//     if (path == "profileUrl") {
//       file = await showChoiceDialog(context);
//     } else if (path == "document") {
//       //file = await showFileselectionDilog(context);
//     }
//     if (file != null) {
//       debugPrint(file.path.toString());
//       uplaodStatus = await handleCommonUploadLogic(file: file, path: path);

//       if (uplaodStatus == true && objectKey != null) {
//         uplaodStatus = await updateUserProfile(profileUrl: objectKey!);
//       }
//     }
//     return uplaodStatus;
//   }
// }
