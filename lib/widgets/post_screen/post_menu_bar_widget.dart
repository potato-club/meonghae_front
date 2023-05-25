import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';

class PostMenuBarWidget extends StatelessWidget {
  final String currentSection;
  final Function setSectionName;
  const PostMenuBarWidget(
      {super.key, required this.currentSection, required this.setSectionName});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => setSectionName('boast'),
          child: Column(
            children: [
              Text(
                '멍자랑',
                style: TextStyle(
                    fontSize: 16,
                    color: currentSection == 'boast'
                        ? CustomColor.brown1
                        : CustomColor.lightGray2,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 6),
              Container(
                  decoration: BoxDecoration(
                      color: currentSection == 'boast'
                          ? CustomColor.brown1
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(1)),
                  width: 30,
                  height: 2)
            ],
          ),
        ),
        const SizedBox(width: 24),
        GestureDetector(
          onTap: () => setSectionName('fun'),
          child: Column(
            children: [
              Text(
                '웃긴멍',
                style: TextStyle(
                    fontSize: 16,
                    color: currentSection == 'fun'
                        ? CustomColor.brown1
                        : CustomColor.lightGray2,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 6),
              Container(
                  decoration: BoxDecoration(
                      color: currentSection == 'fun'
                          ? CustomColor.brown1
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(1)),
                  width: 30,
                  height: 2)
            ],
          ),
        ),
        const SizedBox(width: 24),
        GestureDetector(
          onTap: () => setSectionName('missing'),
          child: Column(
            children: [
              Text(
                '실종신고',
                style: TextStyle(
                    fontSize: 16,
                    color: currentSection == 'missing'
                        ? CustomColor.brown1
                        : CustomColor.lightGray2,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 6),
              Container(
                  decoration: BoxDecoration(
                      color: currentSection == 'missing'
                          ? CustomColor.brown1
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(1)),
                  width: 30,
                  height: 2)
            ],
          ),
        ),
      ],
    );
  }
}
