import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:guidist/src/feature/auth/presentation/pages/auth_success.dart";
import "package:guidist/src/feature/auth/presentation/pages/create_account_page.dart";
import "package:guidist/src/feature/auth/presentation/pages/login_page.dart";
import "package:guidist/src/feature/auth/presentation/pages/choose_panel.dart";
import "package:guidist/src/feature/chat/presentation/pages/chat_page.dart";
import "package:guidist/src/feature/init/presentation/pages/landing_page.dart";
import "package:guidist/src/feature/modules/tourist/home/presenatation/pages/tourist_home_page.dart";
import "package:guidist/src/feature/profile/presentation/pages/profile_page.dart";
import "package:guidist/src/feature/schedule/presentation/pages/schedule_page.dart";
import "../../feature/init/presentation/pages/splash_page.dart";
import "../../feature/main/presenatation/pages/main_page.dart";
import "app_route_name.dart";

final class AppRouter {
  static GoRouter router = GoRouter(
    initialLocation: AppRouteName.splashPage,
    routes: <RouteBase>[
      // GoRoute(
      //   path: AppRouteName.initPage,
      //   builder: (BuildContext context, GoRouterState state) => const InitPage(),
      // ),
      GoRoute(
        path: AppRouteName.splashPage,
        builder: (BuildContext context, GoRouterState state) => const SplashPage(),
      ),
      GoRoute(
        path: AppRouteName.landingPage,
        builder: (BuildContext context, GoRouterState state) => const LandingPage(),
      ),
      GoRoute(
        path: AppRouteName.choosePanelPage,
        builder: (BuildContext context, GoRouterState state) => const ChoosePanel(),
      ),
      GoRoute(
        path: AppRouteName.loginPage,
        builder: (BuildContext context, GoRouterState state) => const LoginPage(),
      ),
      GoRoute(
        path: AppRouteName.createAccountPage,
        builder: (BuildContext context, GoRouterState state) => const CreateAccountPage(),
      ),
      GoRoute(
        path: AppRouteName.authSuccess,
        builder: (BuildContext context, GoRouterState state) => const AuthSuccess(),
      ),
      ShellRoute(
        builder: (BuildContext context, GoRouterState state, Widget child) {
          return MainPage(child: child);
        },
        routes: [
          GoRoute(
            path: AppRouteName.touristHomePage,
            builder: (BuildContext context, GoRouterState state) => const TouristHomePage(),
          ),
          GoRoute(
            path: AppRouteName.schedulePage,
            builder: (BuildContext context, GoRouterState state) => const SchedulePage(),
          ),
          GoRoute(
            path: AppRouteName.chatPage,
            builder: (BuildContext context, GoRouterState state) => const ChatPage(),
          ),
          GoRoute(
            path: AppRouteName.profilePage,
            builder: (BuildContext context, GoRouterState state) => const ProfilePage(),
          ),
        ],
      )
    ],
  );
}
