import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';

class DogSelectWidget extends StatefulWidget {
  final List<dynamic>? dogsInfo;
  final Map<String, dynamic> calendarData;
  final Function setCalendarData;
  const DogSelectWidget(
      {super.key,
      required this.dogsInfo,
      required this.calendarData,
      required this.setCalendarData});

  @override
  State<DogSelectWidget> createState() => _DogSelectWidgetState();
}

class _DogSelectWidgetState extends State<DogSelectWidget> {
  Widget createDogCardItem(dynamic dogInfo, bool isEnd) {
    return Padding(
      padding: EdgeInsets.only(right: isEnd ? 0 : 30),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.ease,
        child: InkWell(
          onTap: () => widget.setCalendarData('petId', dogInfo['id']),
          child: Column(
            children: [
              Container(
                clipBehavior: Clip.hardEdge,
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: CustomColor.ivory2,
                  shape: BoxShape.circle,
                ),
                child: ColorFiltered(
                  colorFilter: widget.calendarData['petId'] == dogInfo['id']
                      ? ColorFilter.mode(
                          Colors.transparent, BlendMode.saturation)
                      : ColorFilter.mode(CustomColor.gray, BlendMode.screen),
                  child: dogInfo['s3ResponseDto'] != null
                      ? Image.network(dogInfo['s3ResponseDto']['fileUrl'],
                          fit: BoxFit.cover)
                      : null,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  dogInfo['petName'],
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: widget.calendarData['petId'] == dogInfo['id']
                        ? CustomColor.black2
                        : CustomColor.gray,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 84,
      child: Padding(
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
                    CustomColor.ivory2,
                    CustomColor.ivory2.withOpacity(0),
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
                    CustomColor.ivory2,
                    CustomColor.ivory2.withOpacity(0),
                  ])),
              height: 91,
              width: MediaQuery.of(context).size.width * 0.06,
            ),
          ),
        ]),
      ),
    );
  }
}
