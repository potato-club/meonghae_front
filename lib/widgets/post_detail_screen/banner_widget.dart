import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/svg/arrow.dart';
import 'package:meonghae_front/widgets/svg/more.dart';

class BannerWidget extends StatelessWidget {
  final Function setIsPostMoreModal;
  const BannerWidget({super.key, required this.setIsPostMoreModal});

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
                InkWell(
                    onTap: () => setIsPostMoreModal(true),
                    child: const SizedBox(width: 16, child: MoreSVG()))
              ],
            ),
          ),
          const SizedBox(height: 16)
        ],
      ),
    );
  }
}
