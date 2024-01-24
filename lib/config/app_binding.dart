import 'package:get/get.dart';
import 'package:meonghae_front/controllers/calendar_controller.dart';
import 'package:meonghae_front/controllers/dog_controller.dart';
import 'package:meonghae_front/controllers/inquiry_controller.dart';
import 'package:meonghae_front/controllers/post_controller.dart';
import 'package:meonghae_front/controllers/post_detail_controller.dart';
import 'package:meonghae_front/controllers/post_edit_controller.dart';
import 'package:meonghae_front/controllers/review_controller.dart';
import 'package:meonghae_front/controllers/user_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PostController());
    Get.put(PostDetailController());
    Get.put(PostEditController());
    Get.put(ReviewController());
    Get.put(UserController());
    Get.put(DogController());
    Get.put(CalendarController());
    Get.put(InquiryController());
  }
}
