import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';

class SearchItemWidget extends StatelessWidget {
  const SearchItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text('4월 27일 목요일',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
          ),
          const SizedBox(height: 6),
          Container(
            decoration: BoxDecoration(
                color: CustomColor.white,
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 14, top: 18, bottom: 28, right: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 5,
                        height: 20,
                        decoration: BoxDecoration(
                            color: CustomColor.brown1,
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      const SizedBox(width: 8),
                      const Text('오전 10:00',
                          style:
                              TextStyle(fontSize: 14, color: CustomColor.gray)),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.06),
                      const Text.rich(TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: '멍멍이의 ',
                            style: TextStyle(
                                fontSize: 14, color: CustomColor.gray),
                          ),
                          TextSpan(
                            text: '예방주사',
                            style: TextStyle(
                                fontSize: 14, color: CustomColor.brown1),
                          ),
                          TextSpan(
                            text: '',
                            style: TextStyle(
                                fontSize: 14, color: CustomColor.gray),
                          ),
                        ],
                      )),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Text(
                      '메모 내용 솰라솰라',
                      style: TextStyle(fontSize: 13, color: CustomColor.gray),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
