import 'package:caringio_student/View/bottomNavPage/bottem_nav.dart';
import 'package:caringio_student/View/logIn/login_screen.dart';
import 'package:caringio_student/View/logIn/services/auth_services.dart';
import 'package:caringio_student/constants.dart';
import 'package:caringio_student/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static String routeName = "/splash_screen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Image gifImage = Image.asset("assets/gif/caringio splash gif.gif");

  @override
  void initState() {
    super.initState();
    checkUserLoggedIn();
  }

  Future<void> checkUserLoggedIn() async {
    bool isLoggedIn = await isUserLoggedIn();
    if (isLoggedIn) {
      // User is already logged in, navigate to the bottom navigation screen.
      Get.offAllNamed(BottomNavScreen.routeName);
    } else {
      Get.offAllNamed(LoginScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    // isUserLoggedIn().then((isLoggedIn) {
    //   log(isLoggedIn.toString());
    //   if (isLoggedIn) {
    //     Get.offAndToNamed(BottomNavScreen.routeName);
    //   } else {
    //
    //   }
    // });
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 251, 246, 242),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage(splashGif),
        )),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(gifImage.image, context);
  }
}
