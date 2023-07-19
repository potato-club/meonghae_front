import 'package:flutter/material.dart';
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
  bool isEdit = false;
  @override
  Widget build(BuildContext context) {
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
            SizedBox(height: 60),
            isEdit ? EditUserInfoWidget() : ShowUserInfoWidget(),
            SizedBox(height: 54),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(288, 49),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  backgroundColor: CustomColor.black2,
                  elevation: 0),
              onPressed: () {
                setState(() => isEdit = !isEdit);
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
