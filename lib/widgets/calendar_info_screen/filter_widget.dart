import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({super.key});

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
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: PopupMenuButton<String>(
                    initialValue: selectedDropdown,
                    child: SizedBox(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            selectedDropdown,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: CustomColor.gray,
                            ),
                          ),
                          const Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ),
                    itemBuilder: (BuildContext context) {
                      return dropdownList.map((String item) {
                        return PopupMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: CustomColor.gray,
                            ),
                          ),
                        );
                      }).toList();
                    },
                    onSelected: (String value) {
                      setState(() {
                        selectedDropdown = value;
                      });
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 24,
        ),
        Container(
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
                            } else {
                              selectedIndex = index;
                            }
                          });
                        },
                        style: ButtonStyle(
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
                        child: Padding(
                          padding: const EdgeInsets.only(left: 22),
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
