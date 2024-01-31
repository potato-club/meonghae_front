import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/controllers/user_controller.dart';
import 'package:meonghae_front/themes/custom_color.dart';
import 'package:meonghae_front/widgets/common/select_input_widget.dart';
import 'package:meonghae_front/widgets/format/date_input_formatter.dart';
import 'package:intl/intl.dart';

class UserFormWidget extends StatefulWidget {
  const UserFormWidget({super.key});

  @override
  State<UserFormWidget> createState() => _UserFormWidgetState();
}

class _UserFormWidgetState extends State<UserFormWidget> {
  @override
  Widget build(BuildContext context) {
    List<String> generateNumberOptions() {
      List<String> options = [];
      for (int i = 1; i < 100; i++) {
        options.add(i.toString());
      }
      return options;
    }

    return Padding(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.19,
        right: MediaQuery.of(context).size.width * 0.14,
      ),
      child: GetX<UserController>(builder: (controller) {
        return Column(
          children: [
            Row(
              children: [
                const Text(
                  '이름',
                  style: TextStyle(fontSize: 16, color: CustomColor.black2),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.075),
                Expanded(
                  child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: TextFormField(
                        controller: controller.nameTextController,
                        decoration: const InputDecoration(
                            hintText: '이름을 입력해 주세요',
                            alignLabelWithHint: true,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 14),
                            hintStyle: TextStyle(
                              color: CustomColor.gray,
                              fontSize: 14,
                            )),
                        style: const TextStyle(fontSize: 14),
                        keyboardType: TextInputType.text,
                      ),
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
                  style: TextStyle(fontSize: 16, color: CustomColor.black2),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.075),
                Expanded(
                  child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: TextFormField(
                        controller: controller.birthTextController,
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
                            fontSize: 14,
                          ),
                        ),
                        style: const TextStyle(fontSize: 14),
                        keyboardType: TextInputType.number,
                      ),
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
                  style: TextStyle(fontSize: 16, color: CustomColor.black2),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.075),
                SelectInputWidget(
                  width: 60,
                  height: 30,
                  itemHeight: 30,
                  listHeight: 120,
                  fontSize: 14,
                  list: generateNumberOptions(),
                  defaultValue: controller.registerAge.value,
                  setValue: (value) => controller.registerAge.value = value,
                )
              ],
            )
          ],
        );
      }),
    );
  }
}
