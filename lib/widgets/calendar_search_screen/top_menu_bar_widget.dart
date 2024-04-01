import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/controllers/calendar_controller.dart';
import 'package:meonghae_front/themes/custom_color.dart';
import 'package:meonghae_front/widgets/svg/arrow.dart';
import 'package:meonghae_front/widgets/svg/search.dart';

class TopMenuBarWidget extends StatefulWidget {
  const TopMenuBarWidget({super.key});

  @override
  State<TopMenuBarWidget> createState() => _TopMenuBarWidgetState();
}

class _TopMenuBarWidgetState extends State<TopMenuBarWidget> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.035),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              Get.back();
              Get.find<CalendarController>().searchEvents.clear();
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: const SizedBox(
                width: 34,
                height: 34,
                child: Align(
                    alignment: Alignment.center,
                    child: ArrowSVG(strokeColor: CustomColor.black2))),
          ),
          Expanded(
            child: TextFormField(
              controller: _searchController,
              onEditingComplete: () =>
                  Get.find<CalendarController>().search(_searchController.text),
              decoration: const InputDecoration(
                hintText: "검색어를 입력해주세요",
                hintStyle: TextStyle(
                  color: CustomColor.gray,
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
                alignLabelWithHint: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 8),
                errorStyle: TextStyle(fontSize: 11, color: Colors.transparent),
              ),
              textAlignVertical: TextAlignVertical.center,
              style: const TextStyle(
                fontSize: 18,
                color: CustomColor.black2,
                fontWeight: FontWeight.w700,
              ),
              keyboardType: TextInputType.text,
              validator: (value) {
                return null;
              },
            ),
          ),
          InkWell(
            onTap: () =>
                Get.find<CalendarController>().search(_searchController.text),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: const SizedBox(
                width: 34,
                height: 34,
                child: Align(
                    alignment: Alignment.center,
                    child: SearchSVG(strokeColor: CustomColor.black2))),
          ),
        ],
      ),
    );
  }
}
