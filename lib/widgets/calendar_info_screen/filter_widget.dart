import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/calendar_info_screen/filter_input_widget.dart';

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
        FilterInputWidget(
            width: MediaQuery.of(context).size.width * 0.88,
            height: 45,
            itemHeight: 45,
            list: textButtonData,
            listHeight: 180,
            borderRadius: 10,
            setValue: (String value) =>
                setState(() => selectedDropdown = value)),
        const SizedBox(
          height: 24,
        ),
        Container(
          decoration: BoxDecoration(
            color: CustomColor.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (int index = 0; index < textButtonData.length; index++)
                InkWell(
                  onTap: () {
                    setState(() {
                      if (selectedIndex == index) {
                        selectedIndex = -1;
                      } else {
                        selectedIndex = index;
                      }
                    });
                  },
                  child: Container(
                    alignment: Alignment.centerLeft,
                    height: 45,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22),
                      child: Text(
                        textButtonData[index],
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
