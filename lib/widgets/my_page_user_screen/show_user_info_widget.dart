import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/user/user_info.dart';

class ShowUserInfoWidget extends StatefulWidget {
  const ShowUserInfoWidget({super.key});

  @override
  State<ShowUserInfoWidget> createState() => _ShowUserInfoWidgetState();
}

class _ShowUserInfoWidgetState extends State<ShowUserInfoWidget> {
  String? name;
  String? birth;
  String? image;
  String? age;

  @override
  void initState() {
    readUserInfo();
    super.initState();
  }

  Future<void> readUserInfo() async {
    var userName = await readUserNickname();
    var userFileUrl = await readUserFileUrl();
    var userBirth = await readUserBirth();
    var userAge = await readUserAge();
    setState(() {
      name = userName;
      image = userFileUrl.toString();
      birth = userBirth;
      age = userAge;
    });
  }

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
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: CustomColor.ivory2),
            clipBehavior: Clip.hardEdge,
            child: image != null
                ? Image.network(image!, fit: BoxFit.cover)
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
                    color: CustomColor.ivory3,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      name ?? '',
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
                    color: CustomColor.ivory3,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      birth?.replaceAll('-', '.') ?? '',
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
                    color: CustomColor.ivory3,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      age ?? '',
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
