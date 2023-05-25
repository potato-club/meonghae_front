import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';

class WriteCommentBarWidget extends StatefulWidget {
  const WriteCommentBarWidget({super.key});

  @override
  State<WriteCommentBarWidget> createState() => _WriteCommentBarWidgetState();
}

class _WriteCommentBarWidgetState extends State<WriteCommentBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: CustomColor.white,
          boxShadow: [
            BoxShadow(
                color: CustomColor.black1.withOpacity(0.12),
                offset: const Offset(0, -4),
                blurRadius: 12,
                spreadRadius: 0)
          ],
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      height: 74,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: TextFormField(
          decoration: const InputDecoration(
            hintText: '댓글 입력하기',
            alignLabelWithHint: true,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            filled: true,
            fillColor: CustomColor.ivoey2,
            contentPadding: EdgeInsets.symmetric(horizontal: 14),
            hintStyle: TextStyle(
              color: CustomColor.gray,
              fontSize: 12,
            ),
            errorStyle: TextStyle(fontSize: 11, color: Colors.transparent),
          ),
          // textAlignVertical: isErrorName
          //     ? TextAlignVertical.bottom
          //     : TextAlignVertical.center,
          style: const TextStyle(fontSize: 12),
          keyboardType: TextInputType.text,
          validator: (value) {
            return null;

            // if (value!.isEmpty) {
            //   ScaffoldMessenger.of(context).showSnackBar(
            //     const SnackBar(
            //       content: Text('이름을 입력해 주세요'),
            //       duration: Duration(seconds: 2),
            //     ),
            //   );
            //   setState(() => isErrorName = true);
            //   return "이름을 입력해 주세요";
            // } else if (!RegExp(r'^[ㄱ-ㅎ가-힣]+$').hasMatch(value)) {
            //   ScaffoldMessenger.of(context).showSnackBar(
            //     const SnackBar(
            //       content: Text('한글만 입력 가능합니다'),
            //       duration: Duration(seconds: 2),
            //     ),
            //   );
            //   setState(() => isErrorName = true);
            //   return "한글만 입력 가능합니다";
            // }
            // setState(() => isErrorName = false);
            // return null;
          },
          onSaved: (value) {
            // name = value!;
            // widget.setName(name);
          },
        ),
      ),
    );
  }
}
