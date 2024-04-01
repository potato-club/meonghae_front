import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/controllers/user_controller.dart';
import 'package:meonghae_front/themes/custom_color.dart';
import 'package:meonghae_front/widgets/format/date_input_formatter.dart';
import 'package:meonghae_front/widgets/my_page_user_screen/user_photo_widget.dart';

class EditUserInfoWidget extends StatefulWidget {
  const EditUserInfoWidget({super.key});

  @override
  State<EditUserInfoWidget> createState() => _EditUserInfoWidgetState();
}

class _EditUserInfoWidgetState extends State<EditUserInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.06),
      child: Column(
        children: [
          const UserPhotoWidget(),
          const SizedBox(height: 60),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10, bottom: 8),
                child: Text('이름',
                    style: TextStyle(fontSize: 14, color: CustomColor.black2)),
              ),
              Container(
                  height: 44,
                  width: MediaQuery.of(context).size.width * 0.88,
                  decoration: BoxDecoration(
                      color: CustomColor.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: Get.find<UserController>().nameTextController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    ),
                    style: const TextStyle(
                        fontSize: 14, color: CustomColor.black2),
                  )),
              const Padding(
                padding: EdgeInsets.only(left: 10, bottom: 8, top: 14),
                child: Text('생일',
                    style: TextStyle(fontSize: 14, color: CustomColor.black2)),
              ),
              Container(
                  height: 44,
                  width: MediaQuery.of(context).size.width * 0.88,
                  decoration: BoxDecoration(
                      color: CustomColor.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    inputFormatters: [
                      DateInputFormatter(),
                    ],
                    controller: Get.find<UserController>().birthTextController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    ),
                    style: const TextStyle(
                        fontSize: 14, color: CustomColor.black2),
                  )),
              const Padding(
                padding: EdgeInsets.only(left: 10, bottom: 8, top: 14),
                child: Text('나이',
                    style: TextStyle(fontSize: 14, color: CustomColor.black2)),
              ),
              Container(
                  height: 44,
                  width: MediaQuery.of(context).size.width * 0.88,
                  decoration: BoxDecoration(
                      color: CustomColor.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: Get.find<UserController>().ageTextController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    ),
                    style: const TextStyle(
                        fontSize: 14, color: CustomColor.black2),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
