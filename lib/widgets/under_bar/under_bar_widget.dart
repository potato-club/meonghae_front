import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meonghae_front/widgets/under_bar/under_bar_icon_button.dart';

class UnderBarWidget extends StatelessWidget {
  const UnderBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
              color: Color(0xFF999999),
              width: 0.3,
            ),
          ),
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
                    isSelected: false,
                    label: '캘린더',
                    iconName: FontAwesomeIcons.calendarCheck,
                  ),
                  UnderBarIconButtonWidget(
                    isSelected: false,
                    label: '게시물',
                    iconName: FontAwesomeIcons.listAlt,
                  ),
                  UnderBarIconButtonWidget(
                    isSelected: true,
                    label: '홈',
                    iconName: FontAwesomeIcons.doorClosed,
                  ),
                  UnderBarIconButtonWidget(
                    isSelected: false,
                    label: '리뷰',
                    iconName: FontAwesomeIcons.penSquare,
                  ),
                  UnderBarIconButtonWidget(
                    isSelected: false,
                    label: '문의',
                    iconName: FontAwesomeIcons.questionCircle,
                  )
                ],
              ),
            )
          ],
        ));
  }
}
