import 'package:caringio_student/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

SnackbarController getSnackbar(
    {required String titile,
    required String discription,
    Color bgColor = ksuccesGreen}) {
  return Get.snackbar(titile, discription,
      backgroundColor: bgColor, colorText: kTextWhite);
}
