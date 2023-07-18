import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/user/user_info.dart';
import 'package:meonghae_front/widgets/format/date_input_formatter.dart';
import 'package:meonghae_front/widgets/my_page_user_screen/user_photo_widget.dart';

class EditUserInfoWidget extends StatefulWidget {
  const EditUserInfoWidget({super.key});

  @override
  State<EditUserInfoWidget> createState() => _EditUserInfoWidgetState();
}

class _EditUserInfoWidgetState extends State<EditUserInfoWidget> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _birthController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  String? name;
  String? birth;
  String? image;
  String? age;

  @override
  void initState() {
    readUserInfo();
    super.initState();
  }

  Future<void> readUserInfo() async {
    var userName = await readUserNickname();
    var userFileUrl = await readUserFileUrl();
    var userBirth = await readUserBirth();
    var userAge = await readUserAge();
    setState(() {
      name = userName;
      image = userFileUrl.toString();
      birth = userBirth;
      age = userAge;
    });
    _nameController.text = name!;
    _birthController.text = birth!.replaceAll('-', '.');
    _ageController.text = age!;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.06),
      child: Column(
        children: [
          UserPhotoWidget(setImageFile: () {}, initImage: image),
          SizedBox(height: 60),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 8),
                child: Text('이름',
                    style: TextStyle(fontSize: 14, color: CustomColor.black2)),
              ),
              Container(
                  height: 44,
                  width: MediaQuery.of(context).size.width * 0.88,
                  decoration: BoxDecoration(
                      color: CustomColor.ivory3,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: _nameController,
                    onChanged: (value) {},
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                    ),
                    style: const TextStyle(
                        fontSize: 14, color: CustomColor.black2),
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 8, top: 14),
                child: Text('생일',
                    style: TextStyle(fontSize: 14, color: CustomColor.black2)),
              ),
              Container(
                  height: 44,
                  width: MediaQuery.of(context).size.width * 0.88,
                  decoration: BoxDecoration(
                      color: CustomColor.ivory3,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    inputFormatters: [
                      DateInputFormatter(),
                    ],
                    controller: _birthController,
                    onChanged: (value) {},
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 12),
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
                      color: CustomColor.ivory3,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: _ageController,
                    onChanged: (value) {},
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 12),
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
