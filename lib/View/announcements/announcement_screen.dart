import 'package:caringio_student/View/announcements/widgets.dart';
import 'package:caringio_student/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../hooks/functions/common_functions.dart';
import 'controller/announcement_controller.dart';

class AnnouncementScreen extends StatefulWidget {
  const AnnouncementScreen({super.key});
  static String routeName = "/announcement_Screen";
  @override
  State<AnnouncementScreen> createState() => _AnnouncementScreenState();
}

var announcementController = Get.find<AnnouncementController>();

class _AnnouncementScreenState extends State<AnnouncementScreen> {
  @override
  void initState() {
    announcementController.getAllAnnouncements();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: announcementAppBar(
          text: "Announcements",
          leadingWidget: const Icon(
            Icons.arrow_back,
            color: kTextWhite,
          ),
          leadingonpress: () {
            Navigator.pop(context);
          },
        ),
        body: Obx(
          () => announcementController.isloading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : announcementController.announcementList.isEmpty
                  ? const Center(
                      child: Text('No announcements found '),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: announcementController.announcementList.length,
                      itemBuilder: (context, index) {
                        return AnnouncementWidget(
                          content: announcementController
                                  .announcementList[index].announcementText ??
                              'no description given',
                          date: formatDate(announcementController
                              .announcementList[index].eventDate),
                        );
                      },
                    ),
        ));
  }
}
