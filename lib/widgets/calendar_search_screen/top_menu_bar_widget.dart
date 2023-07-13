import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meonghae_front/config/base_url.dart';
import 'package:meonghae_front/login/token.dart';
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
    print(searchValue);
    if (searchValue.length >= 2) {
      Dio dio = Dio();
      var token = await readAccessToken();
      dio.options.headers['Authorization'] = token;
      try {
        final response = await dio.get(
            '${baseUrl}profile-service/profile/calendar/find',
            queryParameters: {'key': searchValue});
        if (response.statusCode == 200) {
          widget.setSearchResult(response.data);
        } else {
          SnackBarWidget.show(context, SnackBarType.error, '일정 검색에 실패하였습니다');
        }
      } catch (error) {
        SnackBarWidget.show(context, SnackBarType.error, error.toString());
      }
    } else {
      SnackBarWidget.show(context, SnackBarType.error, '2글자 이상의 단어를 검색해주세요');
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
            onTap: () => Navigator.pop(context),
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
