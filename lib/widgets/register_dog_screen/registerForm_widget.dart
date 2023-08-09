import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/common/select_input_widget.dart';
import 'package:meonghae_front/widgets/format/date_input_formatter.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  List<String> genderList = ['남', '여'];
  List<String> kindList = ['치와와', '불독'];
  List<String> placeList = ['길거리', '집', '병원'];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
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
                    initialValue: name,
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
                      widget.setData(widget.index, 'name', value);
                      setState(() => name = value);
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
                    initialValue: birth,
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
                      widget.setData(widget.index, 'birth', value);
                      setState(() => birth = value);
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
                setValue: setPlace,
                defaultValue: selectedPlace,
              )
            ],
          ),
        ],
      ),
    );
  }
}
