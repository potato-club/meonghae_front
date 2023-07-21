import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/user/user_info.dart';
import 'package:meonghae_front/widgets/format/date_input_formatter.dart';
import 'package:meonghae_front/widgets/my_page_user_screen/user_photo_widget.dart';

class EditUserInfoWidget extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController birthController;
  final TextEditingController ageController;
  final Map<String, dynamic> userInfo;
  final Function setUserInfo;
  const EditUserInfoWidget({
    super.key,
    required this.nameController,
    required this.birthController,
    required this.ageController,
    required this.userInfo,
    required this.setUserInfo,
  });

  @override
  State<EditUserInfoWidget> createState() => _EditUserInfoWidgetState();
}

class _EditUserInfoWidgetState extends State<EditUserInfoWidget> {
  @override
  void initState() {
    readUserInfo();
    super.initState();
  }

  Future<void> readUserInfo() async {
    var userFileUrl = await readUserFileUrl();
    var userName = await readUserNickname();
    var userBirth = await readUserBirth();
    var userAge = await readUserAge();
    widget.setUserInfo('image', userFileUrl);
    widget.setUserInfo('name', userName);
    widget.setUserInfo('birth', userBirth.replaceAll('-', '.'));
    widget.setUserInfo('age', userAge);
    widget.nameController.text = widget.userInfo['name'];
    widget.birthController.text = widget.userInfo['birth'].replaceAll('-', '.');
    widget.ageController.text = widget.userInfo['age'];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.06),
      child: Column(
        children: [
          UserPhotoWidget(
            setImageFile: (value) => widget.setUserInfo('file', value),
            userInfo: widget.userInfo,
          ),
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
                    controller: widget.nameController,
                    onChanged: (value) {},
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 14, vertical: 12),
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
                      color: CustomColor.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    inputFormatters: [
                      DateInputFormatter(),
                    ],
                    controller: widget.birthController,
                    onChanged: (value) {},
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
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
                    controller: widget.ageController,
                    onChanged: (value) {},
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
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
