import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/review_write_screen/star_rating_widget.dart';
import 'package:meonghae_front/widgets/review_write_screen/write_form_widget.dart';

class ReviewWriteScreen extends StatefulWidget {
  const ReviewWriteScreen({super.key});

  @override
  State<ReviewWriteScreen> createState() => _ReviewWriteScreenState();
}

class _ReviewWriteScreenState extends State<ReviewWriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 36),
            StarRatingWidget(),
            SizedBox(height: 28),
            WriteFormWidget(),
            SizedBox(height: 38),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.06),
              child: InkWell(
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: CustomColor.brown1),
                  child: Expanded(
                      child: Center(
                    child: Text("리뷰 등록하기",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: CustomColor.white,
                        )),
                  )),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
