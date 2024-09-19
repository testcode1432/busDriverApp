import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//drawer key
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
//Project version (appVersion = major.miner.patch)
const String appVersion = "v1.0.0";

//defalut font used on application
const defaultFount = "Montserrat";

// Default colors used entire project

const kdefaltBackgroundColor = Color.fromRGBO(254, 247, 243, 1);
const kPageyellow = Color.fromRGBO(225, 107, 0, 1);
const kPagewhite = Color.fromRGBO(225, 199, 0, 1);
const kpageyellow2 = Color(0xffffe5d2);
const kTextBlack = Color(0xFF1F1F1F);
const kTextWhite = Color(0xffffffff);
const kTextRed = Color(0xffcb1a1a);
const klightYellow = Color.fromARGB(255, 255, 235, 135);
const ktextred = Colors.red;
const ksuccesGreen = Color.fromRGBO(4, 208, 0, 100);
const ktextYellow = Color.fromRGBO(225, 168, 0, 1);
const ktexBlue = Color.fromRGBO(0, 209, 225, 1);
const ktexGreen = Color.fromRGBO(4, 208, 0, 1);
const ktextGrey = Color.fromRGBO(156, 156, 156, 1);
const ktextGrey2 = Color.fromRGBO(84, 84, 84, 1);

//continer color
const kcontinerYellow = Color.fromRGBO(225, 107, 0, 1);
const kcontinerYellow2 = Color.fromRGBO(225, 199, 0, 1);
const koffWhite = Color.fromRGBO(247, 241, 237, 1);
const kTransparentYellow = Color.fromARGB(110, 255, 187, 0);

//gradiunt color -1(COntainer marksheet)
const kGradientyellow = Color.fromRGBO(255, 107, 0, 0.2);
const kGradientwhite = Color.fromRGBO(225, 199, 0, 0.2);

//gradiunt color -2(COntainer marksheet)
const kGradientyellow2 = Color.fromRGBO(255, 255, 255, 0.2);
const kGradientwhite2 = Color.fromRGBO(225, 199, 0, 0.2);
const kGradientTextColor1 = Color(0xFFFFC700);
const kGradientTextColor2 = Color(0xFFFF6B00);
const scaffoldbackGroundColor = Color(0xFFFEF7F3);
//Default padding
const double kDefaultPadding = 20.0;

//Default text font used entre Project
TextTheme themeData = TextTheme(
  titleSmall: TextStyle(
    fontSize: 16.sp,
    fontFamily: defaultFount,
    fontWeight: FontWeight.bold,
    color: kTextBlack,
  ),
  bodyLarge: TextStyle(
    fontSize: 36.sp,
    fontFamily: defaultFount,
    fontWeight: FontWeight.w800,
    color: kPageyellow,
  ),
  displayMedium: TextStyle(
    fontSize: 16.sp,
    fontFamily: defaultFount,
    fontWeight: FontWeight.w500,
    color: kTextBlack,
  ),
  displaySmall: TextStyle(
    fontSize: 14.sp,
    fontFamily: defaultFount,
    fontWeight: FontWeight.w500,
    color: kTextWhite,
  ),
  titleLarge: TextStyle(
    fontSize: 32.sp,
    fontFamily: defaultFount,
    fontWeight: FontWeight.w700,
    color: kTextWhite,
  ),
);

//Defalut gradient (login)
const Gradient defaultGradient = LinearGradient(
  colors: [kPagewhite, kPageyellow],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

//Defalut gradient (APPBar)
const Gradient gradientAppbar = LinearGradient(
  colors: [
    kPageyellow,
    kPagewhite,
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

// gradient (continer -school name)
const Gradient gradientContiner = LinearGradient(
  colors: [
    kcontinerYellow2,
    kcontinerYellow,
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

//defalt padding
final defaltPadding = const EdgeInsets.all(10).w.h;

//Default border radius
final defaultBorderRadius = BorderRadius.circular(10);

//sized boxes
final kheight3 = SizedBox(
  height: 3.h,
);
final kheight5 = SizedBox(
  height: 5.h,
);
final kheight6 = SizedBox(
  height: 6.h,
);
final kheight7 = SizedBox(
  height: 7.h,
);
final kheight8 = SizedBox(
  height: 8.h,
);
final kheight9 = SizedBox(
  height: 9.h,
);
final kheight10 = SizedBox(
  height: 10.h,
);
final kheight20 = SizedBox(
  height: 20.h,
);
final kheight28 = SizedBox(
  height: 28.h,
);
final kheight30 = SizedBox(
  height: 30.h,
);
final kheight40 = SizedBox(
  height: 40.h,
);
final kheight80 = SizedBox(
  height: 80.h,
);

// width
final kwidth2 = SizedBox(
  width: 2.w,
);
final kwidth5 = SizedBox(
  width: 5.w,
);
final kwidth10 = SizedBox(
  width: 10.w,
);
final kwidth20 = SizedBox(
  width: 20.w,
);
final kwidth30 = SizedBox(
  width: 30.w,
);
final kwidth40 = SizedBox(
  width: 40.w,
);
