import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/config/app_routes.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/svg/arrow.dart';
import 'package:file_picker/file_picker.dart';
import 'package:meonghae_front/widgets/svg/clip.dart';
import 'package:meonghae_front/widgets/svg/tiny_plus.dart';
import 'package:meonghae_front/widgets/under_bar/under_bar_widget.dart';

class Inquiry1To1Screen extends StatefulWidget {
  const Inquiry1To1Screen({super.key});

  @override
  State<Inquiry1To1Screen> createState() => _Inquiry1To1ScreenState();
}

class _Inquiry1To1ScreenState extends State<Inquiry1To1Screen> {
  String _title = '';
  String _content = '';
  final List<String?> _filePaths = List.filled(2, null);

  Future<void> _pickFile(int index) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _filePaths[index] = result.files.single.path!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.ivory2,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 32),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.06),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => Get.back(),
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: const SizedBox(
                        width: 30,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: ArrowSVG(strokeColor: CustomColor.black2),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () => Get.offNamed(AppRoutes.inquiry1to1),
                        child: const Text(
                          '1대1 문의',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: CustomColor.black2,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () => Get.offNamed(AppRoutes.inquiryHistory),
                        child: const Text(
                          '문의 내역',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: CustomColor.gray,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 26,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: Column(
                  children: [
                    const SizedBox(height: 32),
                    Container(
                      decoration: BoxDecoration(
                        color: CustomColor.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            _title = value;
                          });
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Q. 제목을 입력하세요',
                          labelStyle: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                          contentPadding:
                              EdgeInsets.fromLTRB(10.0, 4.0, 4.0, 4.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 26,
                    ),
                    Container(
                      height: 260,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: CustomColor.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 4.0, 4.0, 4.0),
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              _content = value;
                            });
                          },
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Q. 문의 내용',
                            labelStyle: TextStyle(
                              color: CustomColor.black1,
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                            ),
                            contentPadding: EdgeInsets.symmetric(vertical: 4.0),
                          ),
                          maxLines: null,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 26,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: CustomColor.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 16, bottom: 17),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '파일 첨부 ',
                                    style: TextStyle(
                                      color: CustomColor.black1,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  ClipSVG(),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 21,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () => _pickFile(0),
                                  child: Container(
                                    width: 114,
                                    height: 78,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: CustomColor.lightGray1,
                                          width: 1.0),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: _filePaths[0] != null
                                        ? const Icon(Icons.attach_file,
                                            size: 50, color: Colors.grey)
                                        : const TinyPlusSVG(),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => _pickFile(1),
                                  child: Container(
                                    width: 114,
                                    height: 78,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: CustomColor.lightGray1,
                                          width: 1.0),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: _filePaths[1] != null
                                        ? const Icon(Icons.attach_file,
                                            size: 50, color: Colors.grey)
                                        : const TinyPlusSVG(),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 146,
              ),
              const UnderBarWidget(currentScreen: '문의'),
            ],
          ),
        ),
      ),
    );
  }
}
