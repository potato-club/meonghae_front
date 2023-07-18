import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/my_page_user_screen/edit_user_info_widget.dart';
import 'package:meonghae_front/widgets/my_page_user_screen/show_user_info_widget.dart';
import 'package:meonghae_front/widgets/svg/arrow.dart';

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
      backgroundColor: CustomColor.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 36),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () => Navigator.pop(context),
                  child: SizedBox(
                      child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.06),
                    child: ArrowSVG(strokeColor: CustomColor.black2),
                  )),
                ),
                Text(
                  '내 정보 수정',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: CustomColor.black2,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.06),
                  child: const SizedBox(width: 10),
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
                  backgroundColor: CustomColor.brown1,
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
      )),
    );
  }
}
