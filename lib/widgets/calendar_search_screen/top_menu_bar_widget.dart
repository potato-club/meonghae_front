import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/svg/arrow.dart';
import 'package:meonghae_front/widgets/svg/cancel.dart';

class TopMenuBarWidget extends StatelessWidget {
  const TopMenuBarWidget({super.key});

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
              decoration: const InputDecoration(
                hintText: "검색하세요",
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
            onTap: () => Navigator.pop(context),
            child: const SizedBox(
                width: 30,
                child: Align(alignment: Alignment.center, child: CancelSVG())),
          ),
        ],
      ),
    );
  }
}
