import 'package:get/get.dart';
import 'package:meonghae_front/controllers/post_controller.dart';
import 'package:meonghae_front/controllers/review_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PostController());
    Get.put(ReviewController());
  }
}
