import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/controllers/post_detail_controller.dart';
import 'package:meonghae_front/controllers/post_edit_controller.dart';
import 'package:meonghae_front/models/custom_under_modal_model.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/common/custom_under_modal_widget.dart';
import 'package:meonghae_front/widgets/common/loading_dot_widget.dart';
import 'package:meonghae_front/widgets/post_detail_screen/banner_widget.dart';
import 'package:meonghae_front/widgets/post_detail_screen/detail_comment_widget.dart';
import 'package:meonghae_front/widgets/post_detail_screen/detail_content_widget.dart';
import 'package:meonghae_front/widgets/post_detail_screen/write_comment_bar_widget.dart';

class PostDetailScreen extends StatefulWidget {
  const PostDetailScreen({super.key});
  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  bool isPostMoreModalOpen = false;
  void setIsPostMoreModal(bool value) {
    setState(() => isPostMoreModalOpen = value);
  }

  bool isCommentMoreModalOpen = false;
  void setIsCommentMoreModal(bool value) {
    setState(() => isCommentMoreModalOpen = value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.white,
      body: GetX<PostEditController>(builder: (controller) {
        return Stack(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
                controller:
                    Get.find<PostDetailController>().scrollController.value,
                child: Column(
                  children: [
                    const SizedBox(height: 100),
                    const DetailContentWidget(),
                    DetailCommentWidget(
                        setIsCommentMoreModal: setIsCommentMoreModal),
                  ],
                )),
          ),
          Positioned(
              top: 0,
              child: BannerWidget(setIsPostMoreModal: setIsPostMoreModal)),
          const Positioned(bottom: 0, child: WriteCommentBarWidget()),
          if (isPostMoreModalOpen)
            Positioned(
                bottom: 0,
                child: CustomUnderModalWidget(
                  isOpen: isPostMoreModalOpen,
                  onClose: () => setIsPostMoreModal(false),
                  modalList: [
                    CustomUnderModalModel(
                        label: '게시글 수정하기',
                        onClick: () => controller.goEditScreen()),
                    CustomUnderModalModel(
                        label: '게시글 삭제하기',
                        onClick: () => controller.deleteData()),
                  ],
                )),
          if (isCommentMoreModalOpen)
            Positioned(
                bottom: 0,
                child: CustomUnderModalWidget(
                  isOpen: isCommentMoreModalOpen,
                  onClose: () => setIsCommentMoreModal(false),
                  modalList: [
                    CustomUnderModalModel(
                        label: '대댓글 작성하기',
                        onClick: () {
                          Get.find<PostDetailController>().setReplyMode(true);
                          FocusScope.of(context).unfocus();
                        }),
                    // CustomUnderModalModel(
                    //     label: '댓글 수정하기',
                    //     onClick: () {
                    //       Get.find<PostDetailController>().setReplyMode(true);
                    //     }),
                    CustomUnderModalModel(
                        label: '댓글 삭제하기',
                        onClick: () => controller.deleteComment()),
                  ],
                )),
          if (controller.isEditing.value)
            const Positioned(
                child: Center(
              child: LoadingDotWidget(color: CustomColor.brown1),
            )),
        ]);
      }),
    );
  }
}
