import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/api/dio.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/common/snack_bar_widget.dart';
import 'package:meonghae_front/widgets/svg/arrow.dart';
import 'package:meonghae_front/widgets/svg/search.dart';

class TopMenuBarWidget extends StatefulWidget {
  final Function setSearchResult;
  const TopMenuBarWidget({super.key, required this.setSearchResult});

  @override
  State<TopMenuBarWidget> createState() => _TopMenuBarWidgetState();
}

class _TopMenuBarWidgetState extends State<TopMenuBarWidget> {
  final TextEditingController _searchController = TextEditingController();

  Future<void> handleSearch() async {
    String searchValue = _searchController.text;
    if (searchValue.length >= 2) {
      SendAPI.get(
          url: "/profile-service/profile/calendar/find",
          request: {'key': searchValue},
          successFunc: (data) => widget.setSearchResult(data.data),
          errorMsg: "일정 검색에 실패하였어요");
    } else {
      SnackBarWidget.show(SnackBarType.error, '2글자 이상의 단어를 검색해주세요');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.035),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () => Get.back(),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: const SizedBox(
                width: 34,
                child: Align(
                    alignment: Alignment.center,
                    child: ArrowSVG(strokeColor: CustomColor.black2))),
          ),
          Expanded(
            child: TextFormField(
              controller: _searchController,
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
              onSaved: (value) {},
            ),
          ),
          InkWell(
            onTap: () => handleSearch(),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: const SizedBox(
                width: 30,
                child: Align(
                    alignment: Alignment.center,
                    child: SearchSVG(strokeColor: CustomColor.black2))),
          ),
        ],
      ),
    );
  }
}
