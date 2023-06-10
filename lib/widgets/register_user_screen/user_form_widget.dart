import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/common/select_input_widget.dart';
import 'package:meonghae_front/widgets/format/date_input_formatter.dart';
import 'package:intl/intl.dart';

class UserFormWidget extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final Function setAge;
  final Function setName;
  final Function setBirth;
  const UserFormWidget(
      {super.key,
      required this.formKey,
      required this.setAge,
      required this.setName,
      required this.setBirth});

  @override
  State<UserFormWidget> createState() => _UserFormWidgetState();
}

class _UserFormWidgetState extends State<UserFormWidget> {
  bool isErrorName = false;
  bool isErrorBirth = false;
  String name = '';
  String birth = '';
  @override
  Widget build(BuildContext context) {
    List<String> _generateNumberOptions() {
      List<String> options = [];
      for (int i = 1; i < 100; i++) {
        options.add(i.toString());
      }
      return options;
    }

    return Padding(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.2,
        right: MediaQuery.of(context).size.width * 0.2,
      ),
      child: Form(
        key: widget.formKey,
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  '이름',
                  style: TextStyle(fontSize: 14, color: CustomColor.black2),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.075),
                Expanded(
                  child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: '이름을 입력해 주세요',
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
                        errorStyle:
                            TextStyle(fontSize: 11, color: Colors.transparent),
                      ),
                      textAlignVertical: isErrorName
                          ? TextAlignVertical.bottom
                          : TextAlignVertical.center,
                      style: const TextStyle(fontSize: 12),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          setState(() => isErrorName = true);
                          return "이름을 입력해 주세요";
                        } else if (!RegExp(r'^[ㄱ-ㅎ가-힣]+$').hasMatch(value)) {
                          setState(() => isErrorName = true);
                          return "한글만 입력 가능합니다";
                        }
                        setState(() => isErrorName = false);
                        return null;
                      },
                      onSaved: (value) {
                        name = value!;
                        widget.setName(name);
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text(
                  '생일',
                  style: TextStyle(fontSize: 14, color: CustomColor.black2),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.075),
                Expanded(
                  child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextFormField(
                      inputFormatters: [
                        DateInputFormatter(),
                      ],
                      decoration: InputDecoration(
                        hintText:
                            DateFormat('yyyy.MM.dd').format(DateTime.now()),
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
                        errorStyle: const TextStyle(color: Colors.transparent),
                      ),
                      textAlignVertical: isErrorBirth
                          ? TextAlignVertical.bottom
                          : TextAlignVertical.center,
                      style: const TextStyle(fontSize: 12),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          setState(() => isErrorBirth = true);
                          return "출생일을 입력해 주세요";
                        } else if (!RegExp(r'^[0-9.]+$').hasMatch(value)) {
                          setState(() => isErrorBirth = true);
                          return "숫자와 .만 입력 가능합니다";
                        }
                        setState(() => isErrorBirth = false);
                        return null;
                      },
                      onSaved: (value) {
                        birth = value!;
                        widget.setBirth(birth);
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text(
                  '나이',
                  style: TextStyle(fontSize: 14, color: CustomColor.black2),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.075),
                SelectInputWidget(
                  width: 60,
                  height: 30,
                  itemHeight: 30,
                  listHeight: 120,
                  list: _generateNumberOptions(),
                  setValue: widget.setAge,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
