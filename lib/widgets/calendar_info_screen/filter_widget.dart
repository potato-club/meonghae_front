import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/calendar_info_screen/category_dummy.dart';
import 'package:meonghae_front/widgets/common/select_input_widget.dart';

class FilterWidget extends StatefulWidget {
  final Function setCalendarData;
  final Map<String, dynamic> calendarData;
  const FilterWidget(
      {super.key, required this.setCalendarData, required this.calendarData});

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  @override
  Widget build(BuildContext context) {
    int detailIndex = -1;
    String category = categoryKey[1];
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: SelectInputWidget(
              width: MediaQuery.of(context).size.width * 0.88,
              height: 45,
              itemHeight: 45,
              list: categoryKey,
              listHeight: 180,
              setValue: (String value) => setState(() => category = value),
              isBigIcon: true,
              defaultValue: category,
              fontSize: 14,
              borderRadius: 10,
              textAlign: TextAlign.left,
              isBold: true,
            )),
          ],
        ),
        const SizedBox(
          height: 24,
        ),
        Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: CustomColor.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (int index = 0;
                        index < categoryDetail[category].length;
                        index++)
                      TextButton(
                        onPressed: () {
                          setState(() {
                            if (detailIndex == index) {
                              detailIndex = -1;
                              widget.setCalendarData('vaccinationType', null);
                            } else {
                              detailIndex = index;
                              widget.setCalendarData('vaccinationType',
                                  categoryDetail[category][detailIndex]);
                            }
                          });
                        },
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0))),
                          minimumSize: MaterialStateProperty.all<Size>(
                              const Size(double.infinity, 48)),
                          padding: const MaterialStatePropertyAll<EdgeInsets>(
                              EdgeInsets.symmetric(horizontal: 22)),
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (states) {
                              if (states.contains(MaterialState.pressed) ||
                                  detailIndex == index) {
                                return CustomColor.brown1;
                              }
                              return Colors.transparent;
                            },
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            categoryDetail[category][index][0],
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: CustomColor.black1,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
