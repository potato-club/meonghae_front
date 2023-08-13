import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/controllers/calendar_controller.dart';
import 'package:meonghae_front/controllers/dog_controller.dart';
import 'package:meonghae_front/models/dog_info_model.dart';
import 'package:meonghae_front/themes/customColor.dart';

class DogSelectWidget extends StatefulWidget {
  const DogSelectWidget({super.key});

  @override
  State<DogSelectWidget> createState() => _DogSelectWidgetState();
}

class _DogSelectWidgetState extends State<DogSelectWidget> {
  Widget createDogCardItem(DogInfoModel dogInfo, bool isEnd) {
    return Padding(
      padding: EdgeInsets.only(right: isEnd ? 0 : 30),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.ease,
        child: GetX<CalendarController>(builder: (controller) {
          return InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () => controller.calendarForm.value.petId = dogInfo.id,
            child: Column(
              children: [
                Opacity(
                  opacity: controller.calendarForm.value.petId == dogInfo.id
                      ? 1
                      : 0.5,
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    width: 70,
                    height: 70,
                    decoration: const BoxDecoration(
                      color: CustomColor.white,
                      shape: BoxShape.circle,
                    ),
                    child: dogInfo.s3ResponseDto != null
                        ? Image.network(dogInfo.s3ResponseDto!['fileUrl'],
                            fit: BoxFit.cover)
                        : Transform.scale(
                            scale: 1.8,
                            child: const Image(
                              image: AssetImage(
                                'assets/images/dog_pictures/face.png',
                              ),
                            ),
                          ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    dogInfo.petName,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: controller.calendarForm.value.petId == dogInfo.id
                          ? CustomColor.black2
                          : CustomColor.gray,
                    ),
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Stack(children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: GetX<DogController>(builder: (controller) {
              return Row(
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width * 0.06),
                  if (controller.dogsInfo.isNotEmpty)
                    for (var i = 0; i < controller.dogsInfo.length; i++)
                      createDogCardItem(
                        controller.dogsInfo[i],
                        i + 1 == controller.dogsInfo.length,
                      ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.06),
                ],
              );
            }),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                    CustomColor.ivory2,
                    CustomColor.ivory2.withOpacity(0),
                  ])),
              height: 91,
              width: MediaQuery.of(context).size.width * 0.06,
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      colors: [
                    CustomColor.ivory2,
                    CustomColor.ivory2.withOpacity(0),
                  ])),
              height: 91,
              width: MediaQuery.of(context).size.width * 0.06,
            ),
          ),
        ]),
      ),
    );
  }
}
