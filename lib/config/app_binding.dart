import 'package:get/get.dart';
import 'package:meonghae_front/controllers/post_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PostController());
  }
}
