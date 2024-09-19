
import 'package:caringio_student/View/announcements/announcement_screen.dart';

import 'package:caringio_student/View/bottomNavPage/bottem_nav.dart';
import 'package:caringio_student/View/bustracking/bus_tracking_screen.dart';
import 'package:caringio_student/View/dashboard/dashboard_screen.dart';
import 'package:caringio_student/View/logIn/login_screen.dart';
import 'package:caringio_student/View/privacy_policy/privacypolicy_screen.dart';
import 'package:caringio_student/View/profile/profile_screen.dart';
import 'package:caringio_student/View/refresh_screen/refresh_screen.dart';
import 'package:caringio_student/View/startup/splash_screen.dart';
import 'package:get/get.dart';

import 'View/logIn/reset_password_screen.dart';

final List<GetPage> getRoutes = [
  GetPage(
      name: LoginScreen.routeName,
      page: () => const LoginScreen(),
      transition: Transition.leftToRight),
  GetPage(
      name: DashboardScreen.routeName,
      page: () => DashboardScreen(),
      transition: Transition.leftToRight),
  GetPage(
    name: ProfileScreen.routeName,
    page: () => ProfileScreen(),
    //  transition: Transition.leftToRight
  ),
  GetPage(
    name: AnnouncementScreen.routeName,
    page: () => const AnnouncementScreen(),
    //  transition: Transition.leftToRight
  ),
  GetPage(
    name: BusTrackingScreen.routeName,
    page: () => const BusTrackingScreen(),
    //  transition: Transition.leftToRight
  ),
  GetPage(
    name: BottomNavScreen.routeName,
    page: () => const BottomNavScreen(),
    //  transition: Transition.leftToRight
  ),
  GetPage(
    name: SplashScreen.routeName,
    page: () => const SplashScreen(),
    //  transition: Transition.leftToRight
  ),

  GetPage(
    name: PasswordResetScreen.routeName,
    page: () => const PasswordResetScreen(),
    //  transition: Transition.leftToRight
  ),

  GetPage(
    name: PrivacyPolicy.routeName,
    page: () => const PrivacyPolicy(),
    //  transition: Transition.leftToRight
  ),
  GetPage(
    name: RefreshScreen.routeName,
    page: () => const RefreshScreen(),
    //  transition: Transition.leftToRight
  ),
];
