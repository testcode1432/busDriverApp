import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

import '../bottomNavPage/controller/bottom_nav_controller.dart';

class RefreshScreen extends StatefulWidget {
  const RefreshScreen({super.key});
  static String routeName = "/refresh_screen";

  @override
  State<RefreshScreen> createState() => _RefreshScreenState();
}

var ctrl = Get.put(BottomNavController());
Timer _timer = Timer(Duration(seconds: 0), _timerCallback);
void _timerCallback() {
  // if (ctrl.isNavScreen500.value) {
  //   debugPrint('isNavScreen500 is true');
  //   ctrl.getdata();
  // }
  debugPrint('isNavScreen500 is fasle');
  Get.back();
  ctrl.getdata();
}

class _RefreshScreenState extends State<RefreshScreen> {
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _timer = Timer(Duration(seconds: 1), _timerCallback);
  }

  @override
  Widget build(BuildContext context) {
    // Get.back();
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
        // child: ElevatedButton(
        //   style: ElevatedButton.styleFrom(
        //     padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(20),
        //     ),
        //   ),
        //   onPressed: () async {
        //     Get.back();

        //     // Get.toNamed(RefreshScreen.routeName);
        //     // Get.offAllNamed(LoginScreen.routeName);
        //     // Get.offNamedUntil(
        //     //     '/your_route', (route) => route.isFirst);
        //   },
        //   child: CircularProgressIndicator(),
        // ),
      ),
    );
  }
}
