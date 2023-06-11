import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/review_screen/menu_buttons_widget.dart';
import 'package:meonghae_front/widgets/svg/review_menu/body.dart';
import 'package:meonghae_front/widgets/svg/review_menu/cushion.dart';
import 'package:meonghae_front/widgets/svg/review_menu/dog_chew.dart';
import 'package:meonghae_front/widgets/svg/review_menu/feed.dart';
import 'package:meonghae_front/widgets/svg/review_menu/muzzle.dart';
import 'package:meonghae_front/widgets/svg/review_menu/neck_collar.dart';
import 'package:meonghae_front/widgets/svg/review_menu/pad.dart';
import 'package:meonghae_front/widgets/svg/review_menu/snack.dart';
import 'package:meonghae_front/widgets/svg/review_menu/snood.dart';
import 'package:meonghae_front/widgets/svg/review_menu/stroller.dart';
import 'package:meonghae_front/widgets/svg/review_menu/toy.dart';
import 'package:meonghae_front/widgets/svg/review_menu/washer.dart';

class ReviewMenuButtonsWidget extends StatelessWidget {
  const ReviewMenuButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            decoration: const BoxDecoration(
                border: Border(
                    bottom:
                        BorderSide(width: 1, color: CustomColor.lightGray1))),
            child: const MenuButtonsWidget(
              label1: '넥카라',
              label2: '목줄',
              label3: '장난감',
              widget1: NeckCollarSVG(),
              widget2: SnoodSVG(),
              widget3: ToySVG(),
            )),
        Container(
            decoration: const BoxDecoration(
                border: Border(
                    bottom:
                        BorderSide(width: 1, color: CustomColor.lightGray1))),
            child: const MenuButtonsWidget(
              label1: '방석',
              label2: '목욕용품',
              label3: '사료',
              widget1: CushionSVG(),
              widget2: WasherSVG(),
              widget3: FeedSVG(),
            )),
        Container(
            decoration: const BoxDecoration(
                border: Border(
                    bottom:
                        BorderSide(width: 1, color: CustomColor.lightGray1))),
            child: const MenuButtonsWidget(
              label1: '강아지껌',
              label2: '입마개',
              label3: '유모차',
              widget1: DogChewSVG(),
              widget2: MuzzleSVG(),
              widget3: StrollerSVG(),
            )),
        Container(
            child: const MenuButtonsWidget(
          label1: '배변패드',
          label2: '간식',
          label3: '바디용품',
          widget1: PadSVG(),
          widget2: SnackSVG(),
          widget3: BodySVG(),
        ))
      ],
    );
  }
}
