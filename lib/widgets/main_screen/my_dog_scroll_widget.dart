import 'package:flutter/material.dart';

class MyDogScrollWidget extends StatefulWidget {
  const MyDogScrollWidget({super.key});

  @override
  State<MyDogScrollWidget> createState() => _MyDogScrollWidgetState();
}

class _MyDogScrollWidgetState extends State<MyDogScrollWidget> {
  List<String> dogs = ['흥이1', '흥이2', '흥이3', '흥이4', '흥이5'];

  Widget createDogCardItem(String dogName, bool isEnd) {
    return Padding(
      padding: EdgeInsets.only(right: isEnd ? 0 : 32),
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
                color: const Color(0xFFEAEAEA),
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
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (var i = 0; i < dogs.length; i++)
            createDogCardItem(
              dogs[i],
              i + 1 == dogs.length ? true : false,
            )
        ],
      ),
    );
  }
}
