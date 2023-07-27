import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meonghae_front/api/dio.dart';
import 'package:meonghae_front/screens/post_write_screen.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/post_screen/post_list_item_widget.dart';
import 'package:meonghae_front/widgets/post_screen/post_menu_bar_widget.dart';
import 'package:meonghae_front/widgets/svg/pencil.dart';
import 'package:meonghae_front/widgets/under_bar/under_bar_widget.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  String sectionName = 'boast';
  Future<void> setSectionName(String value) async {
    if (value != sectionName) {
      setState(() => sectionName = value);
      await fetchData();
    }
  }

  List<dynamic> posts = [];

  Map<String, int> currentSection = {'boast': 1, 'fun': 2, 'missing': 3};

  Future<void> fetchData() async {
    SendAPI.get(
      context: context,
      url: "/community-service/boards",
      request: {'type': currentSection[currentSection]},
      successFunc: (data) => setState(() => posts = data.data['content']),
      errorMsg: "게시글 리스트 호출에 실패하였습니다",
    );
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    print(currentSection[sectionName]);
    print(posts[1]);
    return Scaffold(
      backgroundColor: CustomColor.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 32),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.06),
              child: PostMenuBarWidget(
                currentSection: sectionName,
                setSectionName: setSectionName,
              ),
            ),
            const SizedBox(height: 4),
            Expanded(
              child: Stack(children: [
                // BlocProvider(
                //   create: (context) => PostBloc(posts),
                //   child: BlocBuilder<PostBloc, PostState>(
                //     builder: (context, state) {
                //       if (state is PostLoading) {
                //         return Center(
                //           child: CircularProgressIndicator(),
                //         );
                //       } else if (state is PostLoaded) {
                //         return RefreshIndicator(
                //           onRefresh: () async {
                //             BlocProvider.of<PostBloc>(context)
                //                 .add(RefreshPosts());
                //           },
                //           child: ListView.builder(
                //             itemCount: posts.length,
                //             itemBuilder: (context, index) {
                //               return PostListItemWidget(
                //                 postData: posts[index],
                //                 currentSection:
                //                     currentSection[sectionName] ?? 1,
                //                 fetchData: fetchData,
                //               );
                //             },
                //           ),
                //         );
                //       } else if (state is PostError) {
                //         return Center(
                //           child: Text('Error occurred while loading posts.'),
                //         );
                //       }
                //       return Container();
                //     },
                //   ),
                // ),
                Positioned(
                  top: 0,
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                          CustomColor.white,
                          CustomColor.white.withOpacity(0),
                        ])),
                    height: 20,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                Positioned(
                    bottom: 16,
                    right: 16,
                    child: InkWell(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const PostWriteScreen())),
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: CustomColor.brown1,
                        ),
                        width: 70,
                        height: 70,
                        child: const Padding(
                          padding: EdgeInsets.all(22),
                          child: PencilSVG(
                            color: CustomColor.white,
                          ),
                        ),
                      ),
                    ))
              ]),
            ),
            const UnderBarWidget(currentScreen: '게시물'),
          ],
        ),
      ),
    );
  }
}
