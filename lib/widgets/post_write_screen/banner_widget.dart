import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/svg/arrow.dart';

class BannerWidget extends StatelessWidget {
  final Function handleSubmit;
  const BannerWidget({super.key, required this.handleSubmit});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: CustomColor.ivory2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.06),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const SizedBox(
                        width: 20,
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: ArrowSVG(strokeColor: CustomColor.black2)))),
                const Text('게시물 작성',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: CustomColor.black2)),
                InkWell(
                    onTap: () => handleSubmit(),
                    child: const SizedBox(
                        width: 20,
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              '저장',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: CustomColor.gray),
                            ))))
              ],
            ),
          ),
          const SizedBox(height: 16)
        ],
      ),
    );
  }
}
