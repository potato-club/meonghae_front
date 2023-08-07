import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/storages//user/user_info.dart';

class ShowUserInfoWidget extends StatefulWidget {
  final Map<String, dynamic> userInfo;
  const ShowUserInfoWidget({super.key, required this.userInfo});

  @override
  State<ShowUserInfoWidget> createState() => _ShowUserInfoWidgetState();
}

class _ShowUserInfoWidgetState extends State<ShowUserInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.06),
      child: Column(
        children: [
          Container(
            width: 98,
            height: 98,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: CustomColor.white),
            clipBehavior: Clip.hardEdge,
            child: widget.userInfo['image'] != null
                ? Image.network(widget.userInfo['image'], fit: BoxFit.cover)
                : Transform.scale(
                    scale: 1.8,
                    child: const Image(
                      image: AssetImage(
                        'assets/images/dog_pictures/face.png',
                      ),
                    ),
                  ),
          ),
          SizedBox(height: 60),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 8),
                child: Text('이름',
                    style: TextStyle(fontSize: 14, color: CustomColor.black2)),
              ),
              Container(
                height: 44,
                width: MediaQuery.of(context).size.width * 0.88,
                decoration: BoxDecoration(
                    color: CustomColor.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.userInfo['name'] ?? '',
                      style: TextStyle(
                        fontSize: 14,
                        color: CustomColor.black2,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 8, top: 14),
                child: Text('생일',
                    style: TextStyle(fontSize: 14, color: CustomColor.black2)),
              ),
              Container(
                height: 44,
                width: MediaQuery.of(context).size.width * 0.88,
                decoration: BoxDecoration(
                    color: CustomColor.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.userInfo['birth']?.replaceAll('-', '.') ?? '',
                      style: TextStyle(
                        fontSize: 14,
                        color: CustomColor.black2,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 8, top: 14),
                child: Text('나이',
                    style: TextStyle(fontSize: 14, color: CustomColor.black2)),
              ),
              Container(
                height: 44,
                width: MediaQuery.of(context).size.width * 0.88,
                decoration: BoxDecoration(
                    color: CustomColor.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.userInfo['age'] ?? '',
                      style: TextStyle(
                        fontSize: 14,
                        color: CustomColor.black2,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
