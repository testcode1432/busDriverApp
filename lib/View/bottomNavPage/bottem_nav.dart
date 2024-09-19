
import 'package:caringio_student/View/bottomNavPage/controller/bottom_nav_controller.dart';
import 'package:caringio_student/View/dashboard/dashboard_screen.dart';
import 'package:caringio_student/constants.dart';
import 'package:caringio_student/hooks/commonWidgets/common_drawer.dart';
import 'package:caringio_student/model/dashboard/dashboard_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavScreen extends StatefulWidget {
  static String routeName = "/bottom_nav_screen";

  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  DashBoradModel? dashBoradModel;
  final BottomNavController _controller = Get.put(BottomNavController());
  RxBool isLoading = false.obs;
  List<BottomNavigationBarItem> bottomList = [];

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  void fetchData() async{
    isLoading.value = true;
    try {
      await _controller.getdata();
      isLoading.value = false;
    }
    catch (error) {
        // Handle other types of errors as needed
        print("Error: $error");
        isLoading.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx((){
      if(isLoading.isTrue){
        return Scaffold(
            key: scaffoldKey,
            body: const Center(
              child: CircularProgressIndicator(
                color: ktexBlue,
              ),
            )
        );
      }
      else{
        return Scaffold(
          key: scaffoldKey,
          drawer: CustomDrawer(),
          body: DashboardScreen(),
        );
      }
    });
  }

}
