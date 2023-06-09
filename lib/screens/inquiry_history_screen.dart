import 'package:flutter/material.dart';
import 'package:meonghae_front/screens/Inquiry_1to1_screen.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/svg/arrow.dart';
import 'package:meonghae_front/widgets/under_bar/under_bar_widget.dart';

class InQuiryHistoryScreen extends StatefulWidget {
  const InQuiryHistoryScreen({super.key});

  @override
  State<InQuiryHistoryScreen> createState() => _InQuiryHistoryScreenState();
}

List<Map<String, String>> data = [
  {
    'title': '탈퇴가 안된다고',
    'content':
        '탈퇴가 안돼자나요!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@',
    'date': '2023.4.1',
  },
  {
    'title': '탈퇴가 안된다고',
    'content':
        '탈퇴가 안돼자나요!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@',
    'date': '2023.4.1',
  },
];

class _InQuiryHistoryScreenState extends State<InQuiryHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.ivory2,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 32),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.06),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const SizedBox(
                      width: 30,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: ArrowSVG(strokeColor: CustomColor.black2),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const InQuiry1To1Screen()),
                        );
                      },
                      child: const Text(
                        '1대1 문의',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: CustomColor.gray,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const InQuiryHistoryScreen()),
                        );
                      },
                      child: const Text(
                        '문의 내역',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: CustomColor.black2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 22),
                      child: TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(18)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Image.asset(
                                'assets/images/dog_pictures/bone_dog.png',
                              ),
                            ),
                            const SizedBox(
                              width: 18,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data[index]['title'] ?? '',
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: CustomColor.black1,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    data[index]['content'] ?? '',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: CustomColor.gray,
                                    ),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    data[index]['date'] ?? '',
                                    style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: CustomColor.gray,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
