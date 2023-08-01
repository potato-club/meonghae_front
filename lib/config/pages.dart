import 'package:get/get.dart';
import 'package:meonghae_front/screens/Inquiry_1to1_screen.dart';
import 'package:meonghae_front/screens/calendar_info_screen.dart';
import 'package:meonghae_front/screens/calendar_screen.dart';
import 'package:meonghae_front/screens/calendar_search_screen.dart';
import 'package:meonghae_front/screens/inquiry_history_screen.dart';
import 'package:meonghae_front/screens/inquiry_screen.dart';
import 'package:meonghae_front/screens/login_screen.dart';
import 'package:meonghae_front/screens/main_screen.dart';
import 'package:meonghae_front/screens/my_page_dog_screen.dart';
import 'package:meonghae_front/screens/my_page_screen.dart';
import 'package:meonghae_front/screens/my_page_user_screen.dart';
import 'package:meonghae_front/screens/my_page_withdrawal_screen.dart';
import 'package:meonghae_front/screens/post_detail_screen.dart';
import 'package:meonghae_front/screens/post_screen.dart';
import 'package:meonghae_front/screens/post_write_screen.dart';
import 'package:meonghae_front/screens/register_dog_screen.dart';
import 'package:meonghae_front/screens/register_user_screen.dart';
import 'package:meonghae_front/screens/registered_user_screen.dart';
import 'package:meonghae_front/screens/review_menu_screen.dart';
import 'package:meonghae_front/screens/review_screen.dart';
import 'package:meonghae_front/screens/review_write_screen.dart';
import 'package:meonghae_front/screens/select_screen.dart';
import 'package:meonghae_front/screens/video_player_screen.dart';

final List<GetPage> pages = [
  GetPage(name: '/login', page: () => const LoginScreen()),
  // GetPage(name: '/select', page: () => SelectScreen(email: email)),
  // GetPage(name: '/registerUser', page: () => RegisterUserScreen(hasAnimal: hasAnimal, email: email)),
  // GetPage(name: '/registeredUser', page: () => RegisteredUserScreen(imageFile: imageFile, userInfo: userInfo, hasAnimal: hasAnimal)),
  GetPage(name: '/registerDog', page: () => const RegisterDogScreen()),
  GetPage(name: '/introVideo', page: () => const VideoPlayerScreen()),
  GetPage(name: '/', page: () => const MainScreen()),
  // calendar
  GetPage(name: '/calendar', page: () => const CalendarScreen()),
  GetPage(name: '/calendar/info', page: () => const CalendarInfoScreen()),
  GetPage(name: '/calendar/search', page: () => const CalendarSearchScreen()),
  // post
  GetPage(name: '/post', page: () => const PostScreen()),
  // GetPage(name: '/post/detail', page: () => PostDetailScreen(id: id)),
  GetPage(name: '/post/write', page: () => const PostWriteScreen()),
  // review
  // GetPage(name: '/review', page: () => ReviewScreen(menuValue: menuValue)),
  GetPage(name: '/review/menu', page: () => const ReviewMenuScreen()),
  // GetPage(name: '/review/write', page: () => ReviewWriteScreen(fetchData: fetchData)),
  // inquiry
  GetPage(name: '/inquiry', page: () => const InquiryScreen()),
  GetPage(name: '/inquiry/1to1', page: () => const InQuiry1To1Screen()),
  GetPage(name: '/inquiry/history', page: () => const InQuiryHistoryScreen()),
  // mypage
  GetPage(name: '/mypage', page: () => const MyPageScreen()),
  GetPage(name: '/mypage/dog', page: () => const MyPageDogScreen()),
  // GetPage(name: '/mypage/user', page: () => MyPageUserScreen(fetchData: fetchData)),
  GetPage(
      name: '/mypage/withdrawal', page: () => const MyPageWithdrawalScreen()),
];
