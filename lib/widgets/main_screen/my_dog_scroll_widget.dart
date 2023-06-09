import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';

class MyDogScrollWidget extends StatefulWidget {
  final List<dynamic>? dogsInfo;
  const MyDogScrollWidget({super.key, required this.dogsInfo});

  @override
  State<MyDogScrollWidget> createState() => _MyDogScrollWidgetState();
}

class _MyDogScrollWidgetState extends State<MyDogScrollWidget> {
  Widget createDogCardItem(dynamic dogInfo, bool isEnd) {
    return Padding(
      padding: EdgeInsets.only(right: isEnd ? 0 : 30),
      child: Column(
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            width: 70,
            height: 70,
            decoration: const BoxDecoration(
                color: CustomColor.ivory2, shape: BoxShape.circle),
            child: dogInfo['s3ResponseDto'] != null
                ? Image.network(dogInfo['s3ResponseDto']['fileUrl'],
                    fit: BoxFit.cover)
                : null,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              dogInfo['petName'],
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Stack(children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(width: MediaQuery.of(context).size.width * 0.06),
              if (widget.dogsInfo != null)
                for (var i = 0; i < widget.dogsInfo!.length; i++)
                  createDogCardItem(
                    widget.dogsInfo![i],
                    i + 1 == widget.dogsInfo!.length,
                  ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.06),
            ],
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                  CustomColor.white,
                  CustomColor.white.withOpacity(0),
                ])),
            height: 91,
            width: MediaQuery.of(context).size.width * 0.06,
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [
                  CustomColor.white,
                  CustomColor.white.withOpacity(0),
                ])),
            height: 91,
            width: MediaQuery.of(context).size.width * 0.06,
          ),
        ),
      ]),
    );
  }
}
