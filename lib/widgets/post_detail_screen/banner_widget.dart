import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/svg/arrow.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: CustomColor.ivoey2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.06),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const ArrowSVG(strokeColor: CustomColor.black2)),
                const Text('실종신고',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: CustomColor.black2)),
                Transform.translate(
                  offset: const Offset(0, -4),
                  child: const Image(
                      image:
                          AssetImage('assets/images/icon/more_icon_black.png')),
                )
              ],
            ),
          ),
          const SizedBox(height: 16)
        ],
      ),
    );
  }
}
