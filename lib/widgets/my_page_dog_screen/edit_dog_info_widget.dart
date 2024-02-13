import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/controllers/dog_controller.dart';
import 'package:meonghae_front/data/species.dart';
import 'package:meonghae_front/models/dog_info_model.dart';
import 'package:meonghae_front/themes/custom_color.dart';
import 'package:meonghae_front/widgets/common/select_input_widget.dart';
import 'package:meonghae_front/widgets/format/date_input_formatter.dart';
import 'package:meonghae_front/widgets/my_page_dog_screen/dog_photo_widget.dart';

class EditDogInfoWidget extends StatefulWidget {
  final int index;
  const EditDogInfoWidget({
    super.key,
    required this.index,
  });

  @override
  State<EditDogInfoWidget> createState() => _EditDogInfoWidgetState();
}

class _EditDogInfoWidgetState extends State<EditDogInfoWidget> {
  List<String> genderList = ['남', '여'];
  List<String> kindList = dogSpecies + catSpecies;
  List<String> placeList = [
    '지인',
    '일반 애견센터',
    '동물병원',
    '펫샵 등 복합매장',
    '인터넷 개인간 거래',
    '동물보호센터',
    '브리더',
    '길거리 판매자',
    '길거리',
    '유기장소'
  ];

  @override
  Widget build(BuildContext context) {
    return GetX<DogController>(builder: (controller) {
      return Column(
        children: [
          DogPhotoWidget(index: widget.index),
          SizedBox(height: MediaQuery.of(context).size.height * 0.06),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.13),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 66,
                        child: Text(
                          '이름',
                          style: TextStyle(
                              fontSize: 14, color: CustomColor.black2),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 30,
                          child: TextFormField(
                            initialValue:
                                controller.dogsForm[widget.index].petName,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 14),
                            ),
                            textAlignVertical: TextAlignVertical.center,
                            style: const TextStyle(
                              fontSize: 13,
                              color: CustomColor.black2,
                            ),
                            keyboardType: TextInputType.text,
                            onChanged: (value) {
                              controller.dogsForm[widget.index] = DogFormModel(
                                id: controller.dogsForm[widget.index].id,
                                meetRoute:
                                    controller.dogsForm[widget.index].meetRoute,
                                petBirth:
                                    controller.dogsForm[widget.index].petBirth,
                                petGender:
                                    controller.dogsForm[widget.index].petGender,
                                petName: value,
                                petSpecies: controller
                                    .dogsForm[widget.index].petSpecies,
                                image: controller.dogsForm[widget.index].image,
                                s3ResponseDto: controller
                                    .dogsForm[widget.index].s3ResponseDto,
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 66,
                        child: Text(
                          '성별',
                          style: TextStyle(
                              fontSize: 14, color: CustomColor.black2),
                        ),
                      ),
                      SelectInputWidget(
                        width: MediaQuery.of(context).size.width * 0.74 - 66,
                        height: 30,
                        itemHeight: 30,
                        list: genderList,
                        listHeight: 60,
                        textAlign: TextAlign.left,
                        defaultValue:
                            controller.dogsForm[widget.index].petGender == 'BOY'
                                ? '남'
                                : controller.dogsForm[widget.index].petGender ==
                                        'GIRL'
                                    ? '여'
                                    : '',
                        setValue: (value) {
                          controller.dogsForm[widget.index] = DogFormModel(
                            id: controller.dogsForm[widget.index].id,
                            meetRoute:
                                controller.dogsForm[widget.index].meetRoute,
                            petBirth:
                                controller.dogsForm[widget.index].petBirth,
                            petGender: value,
                            petName: controller.dogsForm[widget.index].petName,
                            petSpecies:
                                controller.dogsForm[widget.index].petSpecies,
                            image: controller.dogsForm[widget.index].image,
                            s3ResponseDto:
                                controller.dogsForm[widget.index].s3ResponseDto,
                          );
                        },
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 66,
                        child: Text(
                          '출생일',
                          style: TextStyle(
                              fontSize: 14, color: CustomColor.black2),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 30,
                          child: TextFormField(
                            initialValue:
                                controller.dogsForm[widget.index].petBirth,
                            inputFormatters: [DateInputFormatter()],
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                              filled: true,
                              fillColor: CustomColor.white,
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 14),
                            ),
                            textAlignVertical: TextAlignVertical.center,
                            style: const TextStyle(
                              fontSize: 14,
                              color: CustomColor.black2,
                            ),
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              controller.dogsForm[widget.index] = DogFormModel(
                                id: controller.dogsForm[widget.index].id,
                                meetRoute:
                                    controller.dogsForm[widget.index].meetRoute,
                                petBirth: value,
                                petGender:
                                    controller.dogsForm[widget.index].petGender,
                                petName:
                                    controller.dogsForm[widget.index].petName,
                                petSpecies: controller
                                    .dogsForm[widget.index].petSpecies,
                                image: controller.dogsForm[widget.index].image,
                                s3ResponseDto: controller
                                    .dogsForm[widget.index].s3ResponseDto,
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 66,
                        child: Text(
                          '견종/묘종',
                          style: TextStyle(
                              fontSize: 14, color: CustomColor.black2),
                        ),
                      ),
                      SelectInputWidget(
                        width: MediaQuery.of(context).size.width * 0.74 - 66,
                        height: 30,
                        itemHeight: 30,
                        list: kindList,
                        listHeight: 150,
                        textAlign: TextAlign.left,
                        defaultValue:
                            controller.dogsForm[widget.index].petSpecies,
                        setValue: (value) {
                          controller.dogsForm[widget.index] = DogFormModel(
                            id: controller.dogsForm[widget.index].id,
                            meetRoute:
                                controller.dogsForm[widget.index].meetRoute,
                            petBirth:
                                controller.dogsForm[widget.index].petBirth,
                            petGender:
                                controller.dogsForm[widget.index].petGender,
                            petName: controller.dogsForm[widget.index].petName,
                            petSpecies: value,
                            image: controller.dogsForm[widget.index].image,
                            s3ResponseDto:
                                controller.dogsForm[widget.index].s3ResponseDto,
                          );
                        },
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 66,
                        child: Text(
                          '만남의 경로',
                          style: TextStyle(
                              fontSize: 14, color: CustomColor.black2),
                        ),
                      ),
                      SelectInputWidget(
                        width: MediaQuery.of(context).size.width * 0.74 - 66,
                        height: 30,
                        itemHeight: 30,
                        list: placeList,
                        listHeight: 90,
                        textAlign: TextAlign.left,
                        defaultValue:
                            controller.dogsForm[widget.index].meetRoute,
                        setValue: (value) {
                          controller.dogsForm[widget.index] = DogFormModel(
                            id: controller.dogsForm[widget.index].id,
                            meetRoute: value,
                            petBirth:
                                controller.dogsForm[widget.index].petBirth,
                            petGender:
                                controller.dogsForm[widget.index].petGender,
                            petName: controller.dogsForm[widget.index].petName,
                            petSpecies:
                                controller.dogsForm[widget.index].petSpecies,
                            image: controller.dogsForm[widget.index].image,
                            s3ResponseDto:
                                controller.dogsForm[widget.index].s3ResponseDto,
                          );
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      );
    });
  }
}
