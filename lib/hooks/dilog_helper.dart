import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';

class DialogHelper {
  static void showLoading() {
    Get.dialog(
      Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 100),
        child: WillPopScope(
          onWillPop: () async => false,
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: CircularProgressIndicator(color: ktextYellow),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static void errorDialog(String? message) {
    Get.dialog(
      barrierDismissible: false,
      WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          title: const Text(
            "Error!",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          content: Text(
            message ?? "Please try again later!!",
            // style: const TextStyle(
            //    fontSize: 14, fontWeight: FontWeight.w400, color: kTextGrey),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => hideDialog(),
              child: const Text(
                'OK',
                // style: TextStyle(
                //   color: kPrimaryColor,
                //   fontWeight: FontWeight.w500,
                //   fontSize: 16,
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static void successDialog(String? message) {
    Get.dialog(
      WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          title: const Text(
            "Success",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          content: Text(
            message ?? "Please try again later!!",
            style: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.w400, color: ktextGrey),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => hideDialog(),
              child: const Text(
                'OK',
                style: TextStyle(
                  color: ktextGrey,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static void hideDialog() {
    if (Get.isDialogOpen == true) {
      Get.back();
      return;
    }
  }

  static void showErrorSnackbar(String title, String message) {
    if (!Get.isSnackbarOpen) {
      Get.snackbar(
        "Error!!",
        title,
        snackPosition: SnackPosition.TOP,
        backgroundColor: ktextred,
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
        animationDuration: const Duration(milliseconds: 500),
        messageText: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      );
    }
  }

  // static void showThanksFeedback(bool isOFF, String? redirect) {
  //   Get.defaultDialog(
  //     title: "Thanks For Your Feedback!",
  //     titleStyle: const TextStyle(
  //         fontFamily: "RedHat",
  //         color: kPrimaryColor,
  //         fontSize: 20,
  //         fontWeight: FontWeight.w500),
  //     titlePadding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
  //     content: Container(
  //       padding: const EdgeInsets.all(20),
  //       width: 150,
  //       child: Lottie.asset("assets/lottie/success.json", width: 200,
  //           onLoaded: (composition) {
  //         Future.delayed(const Duration(milliseconds: 1500), () {
  //           if (isOFF) {
  //             Get.offAllNamed(MainScreen.routeName);
  //           } else {
  //             Get.offNamedUntil(
  //                 redirect!, (route) => route.settings.name == redirect);
  //           }
  //         });
  //       }),
  //     ),
  //     onWillPop: () async => false,
  //     barrierDismissible: false,
  //   );
  // }
}
