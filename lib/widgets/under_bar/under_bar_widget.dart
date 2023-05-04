import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/under_bar/under_bar_icon_button.dart';

class UnderBarWidget extends StatelessWidget {
  const UnderBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: CustomColor.black1.withOpacity(0.12),
                offset: const Offset(0, -4),
                blurRadius: 12,
                spreadRadius: 0)
          ],
        ),
        width: MediaQuery.of(context).size.width,
        height: 74,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.06),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UnderBarIconButtonWidget(
                      isSelected: false, label: '캘린더', iconName: 'calendar'),
                  UnderBarIconButtonWidget(
                      isSelected: false, label: '게시물', iconName: 'post'),
                  UnderBarIconButtonWidget(
                      isSelected: true, label: '홈', iconName: 'home'),
                  UnderBarIconButtonWidget(
                      isSelected: false, label: '리뷰', iconName: 'review'),
                  UnderBarIconButtonWidget(
                      isSelected: false, label: '문의', iconName: 'ask')
                ],
              ),
            )
          ],
        ));
  }
}
