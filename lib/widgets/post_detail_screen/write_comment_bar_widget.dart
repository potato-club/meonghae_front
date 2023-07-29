import 'package:flutter/material.dart';
import 'package:meonghae_front/api/dio.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/svg/tiny_right_arrow.dart';

class WriteCommentBarWidget extends StatefulWidget {
  final int id;
  final Function fetchData;
  const WriteCommentBarWidget(
      {super.key, required this.id, required this.fetchData});

  @override
  State<WriteCommentBarWidget> createState() => _WriteCommentBarWidgetState();
}

class _WriteCommentBarWidgetState extends State<WriteCommentBarWidget> {
  TextEditingController textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  void handleClearText() {
    textController.clear();
  }

  Future<void> handlePostComment() async {
    if (textController.text != '') {
      SendAPI.post(
        url: "/community-service/boardComments/${widget.id}",
        request: {"comment": textController.text},
        successFunc: (data) {
          FocusScope.of(context).unfocus();
          handleClearText();
          widget.fetchData();
        },
        errorMsg: "댓글 작성에 실패하였습니다",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomColor.white,
        boxShadow: [
          BoxShadow(
              color: CustomColor.black1.withOpacity(0.20),
              offset: const Offset(0, 8),
              blurRadius: 20,
              spreadRadius: 0)
        ],
      ),
      height: 74,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.06, vertical: 15),
        child: Stack(children: [
          TextFormField(
            controller: textController,
            decoration: const InputDecoration(
              hintText: '댓글 입력하기',
              alignLabelWithHint: true,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              filled: true,
              fillColor: CustomColor.ivory2,
              contentPadding: EdgeInsets.only(left: 14, right: 34),
              hintStyle: TextStyle(
                color: CustomColor.gray,
                fontSize: 12,
              ),
              errorStyle: TextStyle(fontSize: 11, color: Colors.transparent),
            ),
            style: const TextStyle(fontSize: 12),
            keyboardType: TextInputType.text,
          ),
          Positioned(
            right: 0,
            child: InkWell(
              onTap: () => handlePostComment(),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: const SizedBox(
                  width: 34,
                  height: 44,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                    child: TinyRightArrowSVG(color: CustomColor.gray),
                  )),
            ),
          )
        ]),
      ),
    );
  }
}
