import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/common/select_input_widget.dart';

class FilterWidget extends StatefulWidget {
  final Function setContent;
  const FilterWidget({super.key, required this.setContent});

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  List<String> dropdownList = ['예방접종', '구충제 바르기', '건강검진', '기타'];
  String selectedDropdown = '예방접종';
  List<String> textButtonData = [
    '종합백신',
    '코로나 장염',
    '켄넬코프',
    '인플루엔자',
    '광견병 ',
    '항체가검사',
    '심장사상충',
    '외부기생충',
  ];
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: SelectInputWidget(
              width: MediaQuery.of(context).size.width * 0.88,
              height: 45,
              itemHeight: 45,
              list: dropdownList,
              listHeight: 180,
              setValue: (String value) =>
                  setState(() => selectedDropdown = value),
              isBigIcon: true,
              defaultValue: selectedDropdown,
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
                    for (int index = 0; index < textButtonData.length; index++)
                      TextButton(
                        onPressed: () {
                          setState(() {
                            if (selectedIndex == index) {
                              selectedIndex = -1;
                              widget.setContent(null);
                            } else {
                              selectedIndex = index;
                              widget.setContent(textButtonData[index]);
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
                                  selectedIndex == index) {
                                return CustomColor.brown1;
                              }
                              return Colors.transparent;
                            },
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            textButtonData[index],
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
