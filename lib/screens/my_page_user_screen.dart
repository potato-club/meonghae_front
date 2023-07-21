import 'package:flutter/material.dart';
import 'package:meonghae_front/api/dio.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/my_page_user_screen/edit_user_info_widget.dart';
import 'package:meonghae_front/widgets/my_page_user_screen/show_user_info_widget.dart';
import 'package:meonghae_front/widgets/svg/arrow.dart';
import 'package:meonghae_front/widgets/svg/saveCheck.dart';

class MyPageUserScreen extends StatefulWidget {
  const MyPageUserScreen({super.key});

  @override
  State<MyPageUserScreen> createState() => _MyPageUserScreenState();
}

class _MyPageUserScreenState extends State<MyPageUserScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _birthController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  Map<String, dynamic> userInfo = {
    'image': null,
    'name': null,
    'birth': null,
    'age': null,
    'file': null,
  };
  void setUserInfo(String key, dynamic value) {
    setState(() => userInfo[key] = value);
  }

  bool isEdit = false;

  Future<void> editUserInfo() async {
    if (_nameController.text != userInfo['name'] ||
        _birthController.text != userInfo['birth'] ||
        _ageController.text != userInfo['age'] ||
        userInfo['file'] != null) {
      SendAPI.put(
          context: context,
          url: "/user-service/",
          request: {
            'name': userInfo['name'],
            'birth': userInfo['birth'].replaceAll('.', ''),
            'age': userInfo['age'],
          },
          successFunc: (data) => setState(() => isEdit = false),
          errorMsg: "유저 정보 변경에 실패하였습니다");
    } else
      setState(() => isEdit = false);
  }

  @override
  Widget build(BuildContext context) {
    print(userInfo['birth'].replaceAll('.', ''));
    return Scaffold(
      backgroundColor: CustomColor.brown1,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () => Navigator.pop(context),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.06,
                      vertical: 20,
                    ),
                    child: const SizedBox(
                        width: 24,
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: ArrowSVG(strokeColor: CustomColor.black2))),
                  ),
                ),
                const Text(
                  '내 정보 수정',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: CustomColor.black2),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.06,
                    vertical: 20,
                  ),
                  child: const SizedBox(width: 24),
                ),
              ],
            ),
            const SizedBox(height: 60),
            isEdit
                ? EditUserInfoWidget(
                    nameController: _nameController,
                    birthController: _birthController,
                    ageController: _ageController,
                    userInfo: userInfo,
                    setUserInfo: setUserInfo,
                  )
                : const ShowUserInfoWidget(),
            const SizedBox(height: 54),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(288, 49),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  backgroundColor: CustomColor.black2,
                  elevation: 0),
              onPressed: () {
                if (isEdit)
                  editUserInfo();
                else
                  setState(() => isEdit = true);
              },
              child: Text(
                isEdit ? '저장하기' : '수정하기',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
