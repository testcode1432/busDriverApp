import 'package:caringio_student/constants.dart';
import 'package:caringio_student/hooks/commonWidgets/common_text.dart';
import 'package:flutter/material.dart';

import '../../strings.dart';

PreferredSizeWidget gradientAppBar({
  required String text,
  Widget leadingWidget = const SizedBox(),
  Widget centerAppbarWidget = const SizedBox(),
  Widget trailingWidget = const SizedBox(),
  Function()? leadingonpress,
  Function()? trailingonpress,
  double continerhHeight = 150,
  Widget? bottomWidget,
  double prefferdHeight = 250,
}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(prefferdHeight),
    child: Stack(
      children: [
        Container(
          height: continerhHeight,
          decoration: const BoxDecoration(
            // image: DecorationImage(image: AssetImage(appbarBgpng), fit: BoxFit.fill),
            gradient: gradientAppbar,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
          child: AppBar(
            actions: [
              GestureDetector(onTap: trailingonpress, child: trailingWidget),
              kwidth10,
            ],
            flexibleSpace: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(child: centerAppbarWidget),
              ],
            ),
            leading:
                GestureDetector(onTap: leadingonpress, child: leadingWidget),
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: CommonTextSmall(
              text: text,
              weight: FontWeight.w700,
            ),
          ),
        ),
        bottomWidget ?? SizedBox()
      ],
    ),
  );
}
