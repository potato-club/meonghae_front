import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';

class MyDogScrollWidget extends StatefulWidget {
  const MyDogScrollWidget({super.key});

  @override
  State<MyDogScrollWidget> createState() => _MyDogScrollWidgetState();
}

class _MyDogScrollWidgetState extends State<MyDogScrollWidget> {
  List<String> dogs = ['흥이1', '흥이2', '흥이3', '흥이4', '흥이5'];

  Widget createDogCardItem(String dogName, bool isEnd) {
    return Padding(
      padding: EdgeInsets.only(right: isEnd ? 0 : 30),
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
                color: CustomColor.ivoey2,
                borderRadius: BorderRadius.circular(35)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              dogName,
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
              for (var i = 0; i < dogs.length; i++)
                createDogCardItem(
                  dogs[i],
                  i + 1 == dogs.length,
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
