// ignore_for_file: must_be_immutable

import 'package:caringio_student/hooks/commonWidgets/common_text.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

// short height appbar for
PreferredSizeWidget announcementAppBar(
    {required String text,
    Widget leadingWidget = const SizedBox(),
    Widget centerAppbarWidget = const SizedBox(),
    Widget trailingWidget = const SizedBox(),
    Function()? leadingonpress,
    Function()? trailingonpress}) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(90),
    child: Container(
      height: 90,
      decoration: const BoxDecoration(
        gradient: gradientAppbar,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(10),
        ),
      ),
      child: AppBar(
        actions: [
          GestureDetector(onTap: trailingonpress, child: trailingWidget),
          kwidth5
        ],
        flexibleSpace: Stack(
          children: [centerAppbarWidget],
        ),
        leading: GestureDetector(onTap: leadingonpress, child: leadingWidget),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: CommonTextSmall(
          text: text,
          weight: FontWeight.w700,
        ),
      ),
    ),
  );
}

// widget used in the listview builder
class AnnouncementWidget extends StatelessWidget {
  AnnouncementWidget({super.key, required this.date, required this.content});
  String date;
  String content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Container(
        decoration: BoxDecoration(
            color: koffWhite, borderRadius: BorderRadius.circular(5)),
        width: double.infinity,
        // height: 110,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                date,
                style: const TextStyle(
                    fontWeight: FontWeight.w900, color: kPageyellow),
              ),
              kheight5,
              Text(content)
            ],
          ),
        ),
      ),
    );
  }
}
