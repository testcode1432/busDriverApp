import 'package:caringio_student/View/logIn/components/botom_container.dart';
import 'package:caringio_student/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static String routeName = "/logIn_screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage(appbarBgpng), fit: BoxFit.fill),
            ),
            child: Column(
              children: [
                kheight20,
                GradientText(
                  "WELCOME",
                  colors: const [
                    kGradientTextColor2,
                    kPageyellow,
                  ],
                  style: TextStyle(
                    fontFamily: defaultFount,
                    fontSize: 46.71999740600586.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  gradientDirection: GradientDirection.ttb,
                ),
                const BottomContainer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
