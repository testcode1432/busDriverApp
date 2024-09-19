
import 'dart:async';

import 'package:caringio_student/View/bottomNavPage/controller/bottom_nav_controller.dart';
import 'package:caringio_student/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../hooks/commonWidgets/dilog_box.dart';
import '../../../services/location_background_service.dart';
import '../../../services/user_services.dart';

class DashBoardBody extends StatefulWidget {
  const DashBoardBody({
    super.key,
  });

  @override
  State<DashBoardBody> createState() => _DashBoardBodyState();
}

BottomNavController _bottomNavController = Get.find<BottomNavController>();

class _DashBoardBodyState extends State<DashBoardBody>with WidgetsBindingObserver{


  @override
  void initState() {
    WidgetsBinding.instance!.addObserver(this);
    _checkLocationPermission();
    locationBackgroundServiceInitialize();
    super.initState();
  }



  locationBackgroundServiceInitialize()async{
    await initializeService();
  }
  void _checkLocationPermission() async{
    PermissionStatus status = await Permission.location.status;

    print("home Location ========>>>>> $status");
    if(status.isGranted){
      PermissionStatus locationAlwaysStatus = await Permission.locationAlways.status;
      if(locationAlwaysStatus.isGranted){
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          Timer.periodic(const Duration(seconds: 10), (Timer t) => UserContollerService.getLocation());
        });
      }else{
        openLocationAlwaysPermissionPrompt(context).then((value) => _checkLocationPermission());
      }
    }else{
      PermissionStatus status = await Permission.location.request();
      if(status.isGranted){
        PermissionStatus _locationAlwaysStatus = await Permission.locationAlways.status;
        if(_locationAlwaysStatus.isGranted){
          WidgetsBinding.instance?.addPostFrameCallback((_) {
            //Timer.periodic(const Duration(seconds: 10), (Timer t) => UserContollerService.getLocation());
          });
        }else{
          openLocationAlwaysPermissionPrompt(context).then((value) => _checkLocationPermission());
        }
      }else{
        openLocationAlwaysPermissionPrompt(context).then((value) => _checkLocationPermission());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => _bottomNavController.isLoading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _bottomNavController.isStartRide.value ?const Text("Trip is Active"):const Text(""),
                    Container(
                      height: 560,
                      padding: const EdgeInsets.only(left: 40, right: 40, top: 60,),
                      child: Center(
                        child: Column(
                          children: [
                            const Text("Click below button to"),
                            _bottomNavController.isStartRide.value?const Text("stop ride"): const Text("start ride"),
                            kheight20,
                            IconButton(onPressed: (){
                              _bottomNavController.isStartRide.value = !_bottomNavController.isStartRide.value;
                              if(_bottomNavController.isStartRide.value){
                                _bottomNavController.startRide();
                              }else{
                                _bottomNavController.stopRide();
                              }
                            }, icon: _bottomNavController.isStartRide.value ?Image.asset("assets/png/stop_ride.png", scale: 4,):Image.asset("assets/png/start_ride.png", scale: 4,),)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
