import 'package:go_router/go_router.dart';
import 'package:silent_moon/view/auth/auth_view.dart';
import 'package:silent_moon/view/auth/log_in_view.dart';
import 'package:silent_moon/view/auth/sign_up_view.dart';
import 'package:silent_moon/view/counter/user_chat_screen.dart';
import 'package:silent_moon/view/counter/user_details_screen.dart';
import 'package:silent_moon/view/counter/user_list_screen.dart';
import 'package:silent_moon/view/splash/splash_screen.dart';
import 'package:silent_moon/view/welcome/welcome_view.dart';

class AppRoutes {
  static const String users = 'users';
  static const String auth = 'auth';

  static GoRouter goRouter = GoRouter(
    initialLocation: "/auth",
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) {
          return SplashScreen();
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
      GoRoute(
        name: auth,
        path: '/auth',
        builder: (context, state) {
          return AuthView();
        },
        routes: [
          GoRoute(
            path: '/login',
            builder: (context, state) {
              return LogInView();
            },
          ),
          GoRoute(
            path: '/signup',
            builder: (context, state) {
              return SignUpView();
            },
          ),
        ],
      ),
         GoRoute(
        path: "/welcome",
        builder: (context, state) {
          return WelcomeView();
        },
      ),
    ],
  );
}
