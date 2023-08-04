import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/api/dio.dart';
import 'package:meonghae_front/models/post_comment_model.dart';
import 'package:meonghae_front/models/post_detail_model.dart';

class PostDetailController extends GetxController {
  var scrollController = ScrollController().obs;
  var post = PostDetailModel(
    id: 0,
    title: '',
    content: '',
    date: '',
    profileUrl: null,
    images: null,
    commentSize: 0,
    likeStatus: false,
    likes: 0,
  ).obs;
  var id = 0.obs;
  var isLoading = true.obs;
  var hasMore = false.obs;
  var page = 1.obs;
  var comments = <PostCommentModel>[].obs;

  @override
  void onInit() {
    scrollController.value.addListener(() {
      if (scrollController.value.position.pixels ==
              scrollController.value.position.maxScrollExtent &&
          hasMore.value) {
        fetchData();
      }
    });
    super.onInit();
  }

  void setId(int value) {
    comments.clear();
    isLoading.value = true;
    id.value = value;
    page.value = 1;
    fetchData();
  }

  void initPost() {
    post.value = PostDetailModel(
      id: 0,
      title: '',
      content: '',
      date: '',
      profileUrl: null,
      images: null,
      commentSize: 0,
      likeStatus: false,
      likes: 0,
    );
  }

  Future<void> onClickHeart() async {
    post.value = PostDetailModel(
      id: post.value.id,
      title: post.value.title,
      content: post.value.content,
      date: post.value.date,
      profileUrl: post.value.profileUrl,
      images: post.value.images,
      commentSize: post.value.commentSize,
      likeStatus: !post.value.likeStatus,
      likes:
          post.value.likeStatus ? post.value.likes - 1 : post.value.likes + 1,
    );
    await SendAPI.post(
      url: "/community-service/boards/${id.value}/like",
      successFunc: (data) {},
      errorMsg: "좋아요 변경에 실패하였습니다",
    );
  }

  void reload() {
    comments.clear();
    isLoading.value = true;
    page.value = 1;
    fetchData();
  }

  void fetchData() async {
    await SendAPI.get(
      url: "/community-service/boards/${id.value}",
      successFunc: (data) {
        post.value = PostDetailModel.fromJson(data.data);
      },
      errorMsg: "게시글정보 호출에 실패하였습니다",
    );
    await SendAPI.get(
      url: "/community-service/boardComments/${id.value}",
      params: {'p': page.value},
      successFunc: (data) {
        List<Map<String, dynamic>> contentList =
            List<Map<String, dynamic>>.from(data.data['content']);
        hasMore.value = contentList.length == 20;
        final List<PostCommentModel> postList =
            contentList.map((json) => PostCommentModel.fromJson(json)).toList();
        comments.addAll(postList);
      },
      errorMsg: "댓글정보 호출에 실패하였습니다",
    );
    isLoading.value = false;
    if (hasMore.value) page++;
  }

  Future<void> postComment(String comment) async {
    if (comment != '') {
      SendAPI.post(
        url: "/community-service/boardComments/${id.value}",
        request: {"comment": comment},
        successCode: 201,
        successFunc: (data) => reload(),
        errorMsg: "댓글 작성에 실패하였습니다",
      );
    }
  }
}
