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
              id1: 1,
              id2: 2,
              id3: 3,
              widget1: NeckCollarSVG(
                  color1: CustomColor.black4, color2: CustomColor.lightGray3),
              widget2: SnoodSVG(
                  color1: CustomColor.black4, color2: CustomColor.lightGray3),
              widget3: ToySVG(
                  color1: CustomColor.black4, color2: CustomColor.lightGray3),
            )),
        Container(
            decoration: const BoxDecoration(
                border: Border(
                    bottom:
                        BorderSide(width: 1, color: CustomColor.lightGray1))),
            child: const MenuButtonsWidget(
              id1: 4,
              id2: 5,
              id3: 6,
              widget1: CushionSVG(
                  color1: CustomColor.black4, color2: CustomColor.lightGray3),
              widget2: WasherSVG(
                  color1: CustomColor.black4, color2: CustomColor.lightGray3),
              widget3: FeedSVG(
                  color1: CustomColor.black4, color2: CustomColor.lightGray3),
            )),
        Container(
            decoration: const BoxDecoration(
                border: Border(
                    bottom:
                        BorderSide(width: 1, color: CustomColor.lightGray1))),
            child: const MenuButtonsWidget(
              id1: 7,
              id2: 8,
              id3: 9,
              widget1: DogChewSVG(
                  color1: CustomColor.black4, color2: CustomColor.lightGray3),
              widget2: MuzzleSVG(
                  color1: CustomColor.black4, color2: CustomColor.lightGray3),
              widget3: StrollerSVG(
                  color1: CustomColor.black4, color2: CustomColor.lightGray3),
            )),
        const MenuButtonsWidget(
          id1: 10,
          id2: 11,
          id3: 12,
          widget1: PadSVG(
              color1: CustomColor.black4, color2: CustomColor.lightGray3),
          widget2: SnackSVG(
              color1: CustomColor.black4, color2: CustomColor.lightGray3),
          widget3: BodySVG(
              color1: CustomColor.black4, color2: CustomColor.lightGray3),
        )
      ],
    );
  }
}
