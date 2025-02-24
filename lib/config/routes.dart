import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:silent_moon/view/counter/home_screen.dart';
import 'package:silent_moon/view/counter/second_screen.dart';

class AppRoutes {
  static const String homeScreen = '/homeScreen';
  static const String secondScreen = '/secondScreen';

  static List<GetPage<dynamic>> getPages = [
    GetPage(
      name: homeScreen,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: secondScreen,
      page: () => SecondScreen(),
    ),
  ];
}
