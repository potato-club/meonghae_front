import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/common/select_input_widget.dart';
import 'package:meonghae_front/widgets/format/date_input_formatter.dart';
import 'package:meonghae_front/widgets/my_page_dog_screen/dog_photo_widget.dart';

class EditDogInfoWidget extends StatefulWidget {
  final dynamic dogInfo;
  const EditDogInfoWidget({super.key, this.dogInfo});

  @override
  State<EditDogInfoWidget> createState() => _EditDogInfoWidgetState();
}

class _EditDogInfoWidgetState extends State<EditDogInfoWidget> {
  List<String> genderList = ['남', '여'];
  List<String> kindList = ['치와와', '불독'];
  List<String> placeList = ['길거리', '집', '병원'];

  @override
  Widget build(BuildContext context) {
    TextEditingController _nameController =
        TextEditingController(text: widget.dogInfo['petName']);
    TextEditingController _birthController =
        TextEditingController(text: '2023.07.19');
    return Column(
      children: [
        DogPhotoWidget(
            setImageFile: () {},
            initImage: widget.dogInfo['s3ResponseDto']['fileUrl']),
        const SizedBox(height: 40),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.12),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Row(
                  children: [
                    SizedBox(
                      width: 78,
                      child: Text(
                        '이름',
                        style:
                            TextStyle(fontSize: 14, color: CustomColor.black2),
                      ),
                    ),
                    Expanded(
                      child: Container(
                          height: 30,
                          decoration: BoxDecoration(
                            color: CustomColor.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextField(
                            controller: _nameController,
                            onChanged: (value) {},
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 15),
                            ),
                            style: const TextStyle(
                                fontSize: 13, color: CustomColor.black2),
                          )),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 78,
                      child: Text(
                        '성별',
                        style:
                            TextStyle(fontSize: 14, color: CustomColor.black2),
                      ),
                    ),
                    SelectInputWidget(
                      width: MediaQuery.of(context).size.width * 0.76 - 78,
                      height: 30,
                      itemHeight: 30,
                      list: genderList,
                      listHeight: 60,
                      textAlign: TextAlign.left,
                      defaultValue:
                          widget.dogInfo['petGender'] == 'BOY' ? '남' : '여',
                      setValue: (value) {},
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 78,
                      child: Text(
                        '출생일',
                        style:
                            TextStyle(fontSize: 14, color: CustomColor.black2),
                      ),
                    ),
                    Expanded(
                      child: Container(
                          height: 30,
                          decoration: BoxDecoration(
                            color: CustomColor.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextField(
                            inputFormatters: [
                              DateInputFormatter(),
                            ],
                            controller: _birthController,
                            onChanged: (value) {},
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 15),
                            ),
                            style: const TextStyle(
                                fontSize: 13, color: CustomColor.black2),
                          )),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 78,
                      child: Text(
                        '견종/묘종',
                        style:
                            TextStyle(fontSize: 14, color: CustomColor.black2),
                      ),
                    ),
                    SelectInputWidget(
                      width: MediaQuery.of(context).size.width * 0.76 - 78,
                      height: 30,
                      itemHeight: 30,
                      list: kindList,
                      listHeight: 90,
                      textAlign: TextAlign.left,
                      defaultValue: widget.dogInfo['petSpecies'],
                      setValue: (value) {},
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 78,
                      child: Text(
                        '만남의 경로',
                        style:
                            TextStyle(fontSize: 14, color: CustomColor.black2),
                      ),
                    ),
                    SelectInputWidget(
                      width: MediaQuery.of(context).size.width * 0.76 - 78,
                      height: 30,
                      itemHeight: 30,
                      list: placeList,
                      listHeight: 90,
                      textAlign: TextAlign.left,
                      defaultValue: widget.dogInfo['meetRoute'],
                      setValue: (value) {},
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
