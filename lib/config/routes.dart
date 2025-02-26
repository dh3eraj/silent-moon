
import 'package:go_router/go_router.dart';
import 'package:silent_moon/view/counter/user_chat_screen.dart';
import 'package:silent_moon/view/counter/user_details_screen.dart';
import 'package:silent_moon/view/counter/user_list_screen.dart';

class AppRoutes {
  // static const String homeScreen = '/';
  // static const String secondScreen = 'secondScreen';
  static const String users = 'users';

  // static List<GetPage<dynamic>> getPages = [
  //   // GetPage(name: homeScreen, page: () => HomeScreen()),
  //   // GetPage(name: secondScreen, page: () => SecondScreen()),
  //   // GetPage(
  //   //   name: users,
  //   //   page: () => UserListScreen(),
  //   //   children: [
  //   //     GetPage(name: users, page: () => UserDetailsScreen(user: UserModel())),
  //   //   ],
  //   // ),
  // ];
  // // static Route<dynamic> onGenerateRoute(RouteSettings settings) {
  // //   return MaterialPageRoute(
  // //     builder: (context) {
  // //       return routes[settings.name] ?? HomeScreen();
  // //     },
  // //     settings: settings,
  // //   );
  // // }

  // static Map<String, Widget> routes = {
  //   // homeScreen: HomeScreen(),
  //   // secondScreen: SecondScreen(),
  //   users: UserListScreen(),
  // };

  static GoRouter goRouter = GoRouter(
    initialLocation: "/users",
    routes: [
      // GoRoute(
      //   path: homeScreen,
      //   builder: (context, state) {
      //     return HomeScreen();
      //   },
      // ),
      GoRoute(
        path: "/",
        builder: (context, state) {
          return UserListScreen();
        },
      ),
      GoRoute(
        name: users,
        path: "/users",
        builder: (context, state) {
          return UserListScreen();
        },
        routes: [
          GoRoute(
            path: "/:id",
            builder: (context, state) {
              return UserDetailsScreen(
                userId: int.parse(state.pathParameters["id"] ?? "1"),
              );
            },
            routes: [
              GoRoute(
                path: "/chat",
                builder: (context, state) {
                  return UserChatScreen(
                    userId: int.parse(state.pathParameters["id"] ?? "1"),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
