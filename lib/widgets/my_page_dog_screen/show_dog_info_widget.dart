import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';

class ShowDogInfoWidget extends StatefulWidget {
  final dynamic dogInfo;
  const ShowDogInfoWidget({super.key, required this.dogInfo});

  @override
  State<ShowDogInfoWidget> createState() => _ShowDogInfoWidgetState();
}

class _ShowDogInfoWidgetState extends State<ShowDogInfoWidget> {
  Widget makeInfoBox(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          SizedBox(
            width: 78,
            child: Text(
              label,
              style: TextStyle(fontSize: 14, color: CustomColor.black2),
            ),
          ),
          Expanded(
            child: Container(
              height: 30,
              decoration: BoxDecoration(
                color: CustomColor.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14),
                  child: Text(
                    value ?? '',
                    style: TextStyle(
                        fontSize: 13,
                        color: CustomColor.black2,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 130,
          height: 130,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: CustomColor.ivory2),
          clipBehavior: Clip.hardEdge,
          child: widget.dogInfo['s3ResponseDto'] != null
              ? Image.network(widget.dogInfo['s3ResponseDto']['fileUrl']!,
                  fit: BoxFit.cover)
              : Transform.scale(
                  scale: 1.8,
                  child: const Image(
                    image: AssetImage(
                      'assets/images/dog_pictures/face.png',
                    ),
                  ),
                ),
        ),
        const SizedBox(height: 40),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.12),
          child: Column(
            children: [
              makeInfoBox('이름', widget.dogInfo['petName']),
              makeInfoBox(
                  '성별', widget.dogInfo['petGender'] == 'BOY' ? '남' : '여'),
              makeInfoBox('출생일',
                  (widget.dogInfo['petBirth'] ?? '').replaceAll('-', '.')),
              makeInfoBox('견종/묘종', widget.dogInfo['petSpecies']),
              makeInfoBox('만남의 경로', widget.dogInfo['meetRoute']),
            ],
          ),
        )
      ],
    );
  }
}