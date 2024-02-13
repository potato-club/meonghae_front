import 'package:get/get.dart';
import 'package:meonghae_front/screens/calendar_info_screen.dart';
import 'package:meonghae_front/screens/calendar_search_screen.dart';
import 'package:meonghae_front/screens/home_screen.dart';
import 'package:meonghae_front/screens/init_loading_screen.dart';
import 'package:meonghae_front/screens/login_screen.dart';
import 'package:meonghae_front/screens/my_page_dog_screen.dart';
import 'package:meonghae_front/screens/my_page_screen.dart';
import 'package:meonghae_front/screens/my_page_user_screen.dart';
import 'package:meonghae_front/screens/my_page_withdrawal_screen.dart';
import 'package:meonghae_front/screens/post_detail_screen.dart';
import 'package:meonghae_front/screens/post_edit_screen.dart';
import 'package:meonghae_front/screens/post_write_screen.dart';
import 'package:meonghae_front/screens/register_dog_screen.dart';
import 'package:meonghae_front/screens/register_user_screen.dart';
import 'package:meonghae_front/screens/registered_user_screen.dart';
import 'package:meonghae_front/screens/review_screen.dart';
import 'package:meonghae_front/screens/review_write_screen.dart';
import 'package:meonghae_front/screens/select_screen.dart';
import 'package:meonghae_front/screens/video_player_screen.dart';

class AppRoutes {
  static const String initLoading = "/initLoading";
  static const String login = "/login";
  static const String select = "/select";
  static const String registerUser = "/registerUser";
  static const String registeredUser = "/registeredUser";
  static const String registerDog = "/registerDog";
  static const String introVideo = "/introVideo";
  static const String home = "/";
// calendar
  static const String calendarInfo = "/calendar/info";
  static const String calendarSearch = "/calendar/search";
// post
  static const String postDetail = "/post/detail";
  static const String postWrite = "/post/write";
  static const String postEdit = "/post/edit";
// review
  static const String review = "/review";
  static const String reviewWrite = "/review/write";
// mypage
  static const String mypage = "/mypage";
  static const String mypageDog = "/mypage/dog";
  static const String mypageUser = "/mypage/user";
  static const String mypageWithdrawal = "/mypage/withdrawal";

  static final List<GetPage> pages = [
    GetPage(name: initLoading, page: () => const InitLoadingScreen()),
    GetPage(name: login, page: () => const LoginScreen()),
    GetPage(name: select, page: () => const SelectScreen()),
    GetPage(name: registerUser, page: () => const RegisterUserScreen()),
    GetPage(name: registeredUser, page: () => const RegisteredUserScreen()),
    GetPage(name: registerDog, page: () => const RegisterDogScreen()),
    GetPage(name: introVideo, page: () => const VideoPlayerScreen()),
    GetPage(name: home, page: () => const HomeScreen()),
    // calendar
    GetPage(name: calendarInfo, page: () => const CalendarInfoScreen()),
    GetPage(name: calendarSearch, page: () => const CalendarSearchScreen()),
    // post
    GetPage(name: postDetail, page: () => const PostDetailScreen()),
    GetPage(name: postWrite, page: () => const PostWriteScreen()),
    GetPage(name: postEdit, page: () => const PostEditScreen()),
    // review
    GetPage(name: review, page: () => const ReviewScreen()),
    GetPage(name: reviewWrite, page: () => const ReviewWriteScreen()),
    // mypage
    GetPage(name: mypage, page: () => const MyPageScreen()),
    GetPage(name: mypageDog, page: () => const MyPageDogScreen()),
    GetPage(name: mypageUser, page: () => const MyPageUserScreen()),
    GetPage(name: mypageWithdrawal, page: () => const MyPageWithdrawalScreen()),
  ];
}
