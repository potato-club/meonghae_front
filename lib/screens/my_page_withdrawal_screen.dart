import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/user/user_info.dart';
import 'package:meonghae_front/widgets/common/custom_warning_modal_widget.dart';
import 'package:meonghae_front/widgets/svg/arrow.dart';

class MyPageWithdrawalScreen extends StatefulWidget {
  const MyPageWithdrawalScreen({super.key});

  @override
  State<MyPageWithdrawalScreen> createState() => _MyPageWithdrawalScreenState();
}

class _MyPageWithdrawalScreenState extends State<MyPageWithdrawalScreen> {
  String? name = '멍해';
  String? image;

  @override
  void initState() {
    readUserInfo();
    super.initState();
  }

  Future<void> readUserInfo() async {
    var userName = await readUserNickname();
    var userFileUrl = await readUserFileUrl();
    setState(() {
      name = userName;
      image = userFileUrl.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.brown1,
      body: Stack(children: [
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.06),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 130,
                    height: 130,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                        color: CustomColor.white, shape: BoxShape.circle),
                    child: image != null
                        ? Image.network(image!, fit: BoxFit.cover)
                        : Transform.scale(
                            scale: 1.8,
                            child: const Image(
                              image: AssetImage(
                                'assets/images/dog_pictures/face.png',
                              ),
                            ),
                          ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    '$name님과의 이별인가요?\n너무 아쉬워요',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: CustomColor.black2,
                        height: 1.3),
                  ),
                  SizedBox(height: 70),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.88,
                    decoration: BoxDecoration(
                        color: CustomColor.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 22, vertical: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '계정이 비활성화됩니다',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(height: 2),
                          Text(
                            '회원탈퇴 전에 꼭 확인하세요',
                            style: TextStyle(fontSize: 13),
                          ),
                          SizedBox(height: 32),
                          Text(
                            '계정을 삭제하면 모든 활동을 할 수 없게 됩니다\n서비스 악용 방지를 위해 재가입이 제한됩니다\n계정 삭제 후 7일간 다시 가입할 수 없어요',
                            style: TextStyle(fontSize: 13, height: 1.3),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 32),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(288, 49),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        backgroundColor: CustomColor.black2,
                        elevation: 0),
                    onPressed: () => CustomWarningModalWidget.show(
                      context,
                      '계정을 삭제하시겠습니까?',
                      '탈퇴 후 개인정보 등의 데이터가 삭제되며\n복구할 수 없습니다',
                      () {},
                    ),
                    child: Text(
                      '계정 삭제',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ]),
          ),
        ),
        Positioned(
            top: 60,
            child: InkWell(
              onTap: () => Navigator.pop(context),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.06,
                    vertical: 20),
                child: const ArrowSVG(strokeColor: CustomColor.black2),
              ),
            ))
      ]),
    );
  }
}
