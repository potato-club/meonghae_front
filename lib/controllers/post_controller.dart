import 'package:get/get.dart';
import 'package:meonghae_front/api/dio.dart';
import 'package:meonghae_front/models/post_model.dart';

class PostController extends GetxController {
  var posts = <PostModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData(1);
  }

  void fetchData(int type) async {
    SendAPI.get(
      url: "/community-service/boards",
      request: {'type': type},
      successFunc: (data) => posts = data,
      errorMsg: "게시글 리스트 호출에 실패하였습니다",
    );
  }
}
