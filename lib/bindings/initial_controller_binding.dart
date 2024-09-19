
import 'package:get/get.dart';
import '../View/announcements/controller/announcement_controller.dart';
import '../hooks/user_controller.dart';

class IntitalControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<AnnouncementController>(AnnouncementController(), permanent: true);

    Get.put<UserController>(UserController(), permanent: true);
  }
}
//this way Controller we can call

