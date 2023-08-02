import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/common/snack_bar_widget.dart';
import 'package:meonghae_front/widgets/svg/search.dart';

class SearchBarWidget extends StatefulWidget {
  final Function fetchReviewData;
  final Map<String, dynamic>? searchingForm;
  const SearchBarWidget({
    super.key,
    this.searchingForm,
    required this.fetchReviewData,
  });

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
          color: CustomColor.ivory2, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Row(
          children: [
            GestureDetector(
                onTap: () => {
                      if (widget.searchingForm!['keyword'] != null)
                        widget.fetchReviewData()
                      else
                        SnackBarWidget.show(
                            SnackBarType.error, "2글자 이상의 단어를 검색해주세요")
                    },
                child: const SearchSVG(strokeColor: CustomColor.black2)),
            Expanded(
              child: Transform.translate(
                offset: const Offset(0, 2),
                child: TextFormField(
                  decoration: const InputDecoration(
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 14),
                    errorStyle:
                        TextStyle(fontSize: 11, color: Colors.transparent),
                  ),
                  textAlignVertical: TextAlignVertical.center,
                  style:
                      const TextStyle(fontSize: 14, color: CustomColor.black2),
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    return null;
                  },
                  onChanged: (value) {
                    if (value.length > 1) {
                      widget.searchingForm!['keyword'] = value;
                    } else if (value.isEmpty) {
                      if (widget.searchingForm!['keyword'] != null) {
                        widget.searchingForm!['keyword'] = null;
                        widget.fetchReviewData();
                      }
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
