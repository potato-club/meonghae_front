import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:meonghae_front/controllers/dog_controller.dart';
import 'package:meonghae_front/data/species.dart';
import 'package:meonghae_front/models/dog_info_model.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/common/select_input_widget.dart';
import 'package:meonghae_front/widgets/format/date_input_formatter.dart';

class RegisterForm extends StatefulWidget {
  final int index;
  const RegisterForm({super.key, required this.index});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final formKey = GlobalKey<FormState>();
  List<String> genderList = ['남', '여'];
  List<String> kindList = Species.dogSpecies + Species.catSpecies;
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
          Row(
            children: [
              const SizedBox(
                width: 66,
                child: Text(
                  '이름',
                  style: TextStyle(fontSize: 16, color: CustomColor.black2),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 30,
                  child: TextFormField(
                    initialValue: controller.dogsForm[widget.index].petName,
                    decoration: const InputDecoration(
                      hintText: '이름을 입력해주세요',
                      alignLabelWithHint: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(horizontal: 14),
                      hintStyle: TextStyle(
                        color: CustomColor.gray,
                        fontSize: 14,
                      ),
                    ),
                    textAlignVertical: TextAlignVertical.center,
                    style: const TextStyle(
                      fontSize: 14,
                      color: CustomColor.black2,
                    ),
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      controller.dogsForm[widget.index] = DogFormModel(
                        id: controller.dogsForm[widget.index].id,
                        meetRoute: controller.dogsForm[widget.index].meetRoute,
                        petBirth: controller.dogsForm[widget.index].petBirth,
                        petGender: controller.dogsForm[widget.index].petGender,
                        petName: value,
                        petSpecies:
                            controller.dogsForm[widget.index].petSpecies,
                        image: controller.dogsForm[widget.index].image,
                        s3ResponseDto:
                            controller.dogsForm[widget.index].s3ResponseDto,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              const SizedBox(
                width: 66,
                child: Text(
                  '성별',
                  style: TextStyle(fontSize: 16, color: CustomColor.black2),
                ),
              ),
              SelectInputWidget(
                width: MediaQuery.of(context).size.width * 0.74 - 66,
                height: 30,
                itemHeight: 30,
                list: genderList,
                listHeight: 60,
                fontSize: 14,
                hintText: "성별을 선택해 주세요",
                textAlign: TextAlign.left,
                defaultValue: controller.dogsForm[widget.index].petGender,
                setValue: (value) {
                  controller.dogsForm[widget.index] = DogFormModel(
                    id: controller.dogsForm[widget.index].id,
                    meetRoute: controller.dogsForm[widget.index].meetRoute,
                    petBirth: controller.dogsForm[widget.index].petBirth,
                    petGender: value,
                    petName: controller.dogsForm[widget.index].petName,
                    petSpecies: controller.dogsForm[widget.index].petSpecies,
                    image: controller.dogsForm[widget.index].image,
                    s3ResponseDto:
                        controller.dogsForm[widget.index].s3ResponseDto,
                  );
                },
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              const SizedBox(
                width: 66,
                child: Text(
                  '출생일',
                  style: TextStyle(fontSize: 16, color: CustomColor.black2),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 30,
                  child: TextFormField(
                    initialValue: controller.dogsForm[widget.index].petBirth,
                    inputFormatters: [DateInputFormatter()],
                    decoration: InputDecoration(
                      hintText: DateFormat('yyyy.MM.dd').format(DateTime.now()),
                      alignLabelWithHint: true,
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      filled: true,
                      fillColor: CustomColor.white,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 14),
                      hintStyle: const TextStyle(
                        color: CustomColor.gray,
                        fontSize: 14,
                      ),
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
                        meetRoute: controller.dogsForm[widget.index].meetRoute,
                        petBirth: value,
                        petGender: controller.dogsForm[widget.index].petGender,
                        petName: controller.dogsForm[widget.index].petName,
                        petSpecies:
                            controller.dogsForm[widget.index].petSpecies,
                        image: controller.dogsForm[widget.index].image,
                        s3ResponseDto:
                            controller.dogsForm[widget.index].s3ResponseDto,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              const SizedBox(
                width: 66,
                child: Text(
                  '견종/묘종',
                  style: TextStyle(
                    fontSize: 14,
                    color: CustomColor.black2,
                    letterSpacing: -1,
                  ),
                ),
              ),
              SelectInputWidget(
                width: MediaQuery.of(context).size.width * 0.74 - 66,
                height: 30,
                itemHeight: 30,
                list: kindList,
                listHeight: 150,
                fontSize: 14,
                hintText: "견종/묘종을 선택해 주세요",
                textAlign: TextAlign.left,
                defaultValue: controller.dogsForm[widget.index].petSpecies,
                setValue: (value) {
                  controller.dogsForm[widget.index] = DogFormModel(
                    id: controller.dogsForm[widget.index].id,
                    meetRoute: controller.dogsForm[widget.index].meetRoute,
                    petBirth: controller.dogsForm[widget.index].petBirth,
                    petGender: controller.dogsForm[widget.index].petGender,
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
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              const SizedBox(
                width: 66,
                child: Text(
                  '만남의 경로',
                  style: TextStyle(
                    fontSize: 16,
                    color: CustomColor.black2,
                    letterSpacing: -1,
                  ),
                ),
              ),
              SelectInputWidget(
                width: MediaQuery.of(context).size.width * 0.74 - 66,
                height: 30,
                itemHeight: 30,
                list: placeList,
                listHeight: 90,
                fontSize: 14,
                hintText: "만나게 된 경로를 선택해 주세요",
                textAlign: TextAlign.left,
                defaultValue: controller.dogsForm[widget.index].meetRoute,
                setValue: (value) {
                  controller.dogsForm[widget.index] = DogFormModel(
                    id: controller.dogsForm[widget.index].id,
                    meetRoute: value,
                    petBirth: controller.dogsForm[widget.index].petBirth,
                    petGender: controller.dogsForm[widget.index].petGender,
                    petName: controller.dogsForm[widget.index].petName,
                    petSpecies: controller.dogsForm[widget.index].petSpecies,
                    image: controller.dogsForm[widget.index].image,
                    s3ResponseDto:
                        controller.dogsForm[widget.index].s3ResponseDto,
                  );
                },
              )
            ],
          ),
        ],
      );
    });
  }
}
