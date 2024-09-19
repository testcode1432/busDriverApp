import 'package:caringio_student/View/startup/splash_screen.dart';
import 'package:caringio_student/constants.dart';
import 'package:caringio_student/firebase_options.dart';
import 'package:caringio_student/routes.dart';
import 'package:caringio_student/services/push_notification.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'bindings/initial_controller_binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await NotificationService().registerPushNotificationHandler();
  // initializeDateFormatting().then((_) =>
  runApp(const MyApp()); // might change the runapp as it was earlier
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 800),
        builder: (context, child) {
          return GetMaterialApp(
            initialBinding: IntitalControllerBinding(),
            title: 'Caringio Student',
            theme: ThemeData(
              scaffoldBackgroundColor: kdefaltBackgroundColor,
              textTheme: themeData,
              fontFamily: defaultFount,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
              useMaterial3: true,
            ),
            builder: (BuildContext context, Widget? child) {
              final MediaQueryData data = MediaQuery.of(context);
              return MediaQuery(
                data: data.copyWith(
                  textScaleFactor: 1, // Set the desired text scale factor
                ),
                child: child!,
              );
            },
            debugShowCheckedModeBanner: false,
            initialRoute: SplashScreen.routeName,
            getPages: [...getRoutes],
          );
        });
  }
}
