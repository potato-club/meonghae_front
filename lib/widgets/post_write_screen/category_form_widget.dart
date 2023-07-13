import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/common/snack_bar_widget.dart';

class CategoryFormWidget extends StatefulWidget {
  final Map<String, dynamic> writeData;
  final Function setWriteData;
  const CategoryFormWidget({
    super.key,
    required this.writeData,
    required this.setWriteData,
  });

  @override
  State<CategoryFormWidget> createState() => _CategoryFormWidgetState();
}

class _CategoryFormWidgetState extends State<CategoryFormWidget> {
  void handleEditImages() {
    if (widget.writeData['type'] != 3) {
      if (widget.writeData['images'].length > 3) {
        widget.setWriteData('images', widget.writeData['images'].sublist(0, 3));
        SnackBarWidget.show(
            context, SnackBarType.error, '실종신고외의 게시글에서는 최대 3장의 사진만 등록 가능합니다');
      }
    }
  }

  Widget categoryButton(bool selected, String label, Function onTap) {
    return InkWell(
      onTap: () {
        onTap();
        handleEditImages();
      },
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: AnimatedContainer(
          width: selected ? 80 : 64,
          height: selected ? 30 : 24,
          decoration: BoxDecoration(
              color: selected ? CustomColor.brown1 : CustomColor.lightGray3,
              borderRadius: BorderRadius.circular(5)),
          duration: const Duration(milliseconds: 250),
          curve: Curves.ease,
          child: Center(
              child: Text(label,
                  style: TextStyle(
                    fontSize: selected ? 14 : 11,
                    color: selected ? CustomColor.black2 : CustomColor.black4,
                  )))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: 20, left: MediaQuery.of(context).size.width * 0.06, bottom: 6),
      child: SizedBox(
        height: 30,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            categoryButton(
              widget.writeData['type'] == 1,
              '멍자랑',
              () => widget.setWriteData('type', 1),
            ),
            const SizedBox(width: 16),
            categoryButton(
              widget.writeData['type'] == 2,
              '웃긴멍',
              () => widget.setWriteData('type', 2),
            ),
            const SizedBox(width: 16),
            categoryButton(
              widget.writeData['type'] == 3,
              '실종신고',
              () => widget.setWriteData('type', 3),
            ),
          ],
        ),
      ),
    );
  }
}
