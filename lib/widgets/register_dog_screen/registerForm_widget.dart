import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meonghae_front/models/infoModel.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/common/select_input_widget.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final formKey = GlobalKey<FormState>();
  bool isHovered = false;

  List<String> genderList = ['수컷', '암컷'];
  List<String> kindList = ['치와와', '불독'];
  List<String> placeList = ['길거리', '집', '병원'];

  String? selectedGender;
  String? selectedKind;
  String? selectedPlace;
  String _name = '';
  String _birth = '';

  void setGender(String value) {
    setState(() => selectedGender = value);
  }

  void setKind(String value) {
    setState(() => selectedKind = value);
  }

  void setPlace(String value) {
    setState(() => selectedPlace = value);
  }

  List<InfoModel> infoModelList = [];

// 폼 데이터 객체 추가
  void addFormData(String selectedGender, String selectedKind,
      String selectedPlace, String name, String birth) {
    InfoModel formData = InfoModel(
      selectedGender: selectedGender,
      selectedKind: selectedKind,
      selectedPlace: selectedPlace,
      name: name,
      birth: birth,
    );
    infoModelList.add(formData);
    print(infoModelList);
    for (InfoModel infoModel in infoModelList) {
      print('selectedGender: ${infoModel.selectedGender}');
      print('selectedKind: ${infoModel.selectedKind}');
      print('selectedPlace: ${infoModel.selectedPlace}');
      print('name: ${infoModel.name}');
      print('birth: ${infoModel.birth}');
      print('-----------------------');
    }
  }

  void _handleHover(bool isHovered) {
    setState(() {
      this.isHovered = isHovered;
    });
  }

  void _onFormSubmit() {
    if (formKey.currentState!.validate()) {
      // Form의 유효성 검사
      formKey.currentState!.save(); // Form의 입력값 저장
      // 저장된 값을 처리하는 로직 구현
      print(_name);
      print(selectedGender);
      print(_birth);
      print(selectedKind);
      print(selectedPlace);
      // infoModelList가 빈값이라면 5가지 상태 그대로 넘기기
      // 아니라면 infoModelList를 넘기기
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('폼이 성공적으로 제출되었습니다.'),
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      print('form이 작성이 덜 되었음');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Row(
            children: [
              const SizedBox(
                width: 76,
                child: Text(
                  '이름',
                  style: TextStyle(fontSize: 14, color: CustomColor.black2),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 30,
                  child: TextFormField(
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
                        fontSize: 12,
                      ),
                    ),
                    textAlignVertical: TextAlignVertical.center,
                    style: const TextStyle(fontSize: 12),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('이름을 입력해주세요.'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                        return null;
                      } else if (!RegExp(r'^[ㄱ-ㅎ가-힣]+$').hasMatch(value)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('한글만 입력 가능합니다.'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                        return null;
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _name = value!;
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
                width: 76,
                child: Text(
                  '성별',
                  style: TextStyle(fontSize: 14, color: CustomColor.black2),
                ),
              ),
              SelectInputWidget(
                width: MediaQuery.of(context).size.width * 0.74 - 76,
                height: 30,
                itemHeight: 30,
                list: genderList,
                listHeight: 60,
                hintText: "성별을 선택해 주세요",
                textAlign: TextAlign.left,
                setValue: setGender,
                defaultValue: selectedGender,
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              const SizedBox(
                width: 76,
                child: Text(
                  '출생일',
                  style: TextStyle(fontSize: 14, color: CustomColor.black2),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 30,
                  child: TextFormField(
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
                        fontSize: 12,
                      ),
                    ),
                    textAlignVertical: TextAlignVertical.center,
                    style: const TextStyle(fontSize: 12),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('출생일을 입력해주세요'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                        return null;
                      } else if (!RegExp(r'^[0-9.]+$').hasMatch(value)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('숫자와 .만 입력 가능합니다.'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                        return null;
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _birth = value!;
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
                width: 76,
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
                width: MediaQuery.of(context).size.width * 0.74 - 76,
                height: 30,
                itemHeight: 30,
                list: kindList,
                listHeight: 150,
                hintText: "견종/묘종을 선택해 주세요",
                textAlign: TextAlign.left,
                setValue: setKind,
                defaultValue: selectedKind,
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              const SizedBox(
                width: 76,
                child: Text(
                  '만남의 경로',
                  style: TextStyle(
                    fontSize: 14,
                    color: CustomColor.black2,
                    letterSpacing: -1,
                  ),
                ),
              ),
              SelectInputWidget(
                width: MediaQuery.of(context).size.width * 0.74 - 76,
                height: 30,
                itemHeight: 30,
                list: placeList,
                listHeight: 90,
                hintText: "만나게 된 경로를 선택해 주세요",
                textAlign: TextAlign.left,
                setValue: setPlace,
                defaultValue: selectedPlace,
              )
            ],
          ),
          // const SizedBox(
          //   height: 16,
          // ),
          // GestureDetector(
          //   onTap: () {
          //     widget.onAddRegisterInitForm();
          //     addFormData(
          //         selectedGender, selectedKind, selectedPlace, _name, _birth);
          //   },
          //   onTapDown: (_) {
          //     _handleHover(true);
          //   },
          //   onTapUp: (_) {
          //     _handleHover(false);
          //   },
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.end,
          //     children: [
          //       Text(
          //         '추가하기',
          //         style: TextStyle(
          //           fontSize: 13,
          //           fontWeight: isHovered ? FontWeight.bold : FontWeight.w400,
          //           color: const Color(0xff999999),
          //         ),
          //       ),
          //       const Icon(
          //         Icons.arrow_forward_ios_rounded,
          //         color: Color(0xff999999),
          //         size: 16,
          //       ),
          //     ],
          //   ),
          // ),
          // const SizedBox(
          //   height: 36,
          // ),
          // ElevatedButton(
          //   style: ElevatedButton.styleFrom(
          //     fixedSize: const Size(288, 49),
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(5),
          //     ),
          //     backgroundColor: const Color(0xff191919),
          //   ),
          //   onPressed: _onFormSubmit,
          //   child: const Text(
          //     '시작하기!',
          //     style: TextStyle(
          //       fontSize: 16,
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
