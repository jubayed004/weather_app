import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/core/router/route_path.dart';
import 'package:weather_app/features/auth/presentation/screen/active_otp_screen.dart';
import 'package:weather_app/features/auth/presentation/screen/forget_otp_screen.dart';
import 'package:weather_app/features/auth/presentation/screen/sign_up_screen.dart';
import 'package:weather_app/features/auth/presentation/screen/login_screen.dart';
import 'package:weather_app/features/auth/presentation/screen/forget_password_screen.dart';
import 'package:weather_app/features/auth/presentation/screen/reset_password_screen.dart';
import 'package:weather_app/features/auth/presentation/screen/welcome_back_screen.dart';
import 'package:weather_app/features/home/presentation/screen/home_screen.dart';
import 'package:weather_app/features/result/presentation/screen/result_screen.dart';
import 'package:weather_app/features/result_summary/presentation/screen/result_summary.dart';
import 'package:weather_app/features/save/presentation/screen/save_screen.dart';
import 'package:weather_app/utils/extension/base_extension.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static final GoRouter initRoute = GoRouter(
    initialLocation: RoutePath.loginScreen.addBasePath,
    debugLogDiagnostics: true,
    navigatorKey: navigatorKey,
    routes: [
      ///======================= Initial Route =======================
      // GoRoute(
      //   name: RoutePath.splashScreen,
      //   path: RoutePath.splashScreen.addBasePath,
      //   pageBuilder: (context, state) {
      //     return _buildPageWithAnimation(
      //       child: const SplashScreen(),
      //       state: state,
      //     );
      //   },
      // ),
      GoRoute(
        name: RoutePath.signUpScreen,
        path: RoutePath.signUpScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child: const SignUpScreen(),
            state: state,
          );
        },
      ),

      GoRoute(
        name: RoutePath.loginScreen,
        path: RoutePath.loginScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child: const LoginScreen(),
            state: state,
          );
        },
      ),
      GoRoute(
        name: RoutePath.activeOtpScreen,
        path: RoutePath.activeOtpScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child: const ActiveOtpScreen(),
            state: state,
          );
        },
      ),
      GoRoute(
        name: RoutePath.forgetPasswordScreen,
        path: RoutePath.forgetPasswordScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child: const ForgetPasswordScreen(),
            state: state,
          );
        },
      ),

      GoRoute(
        name: RoutePath.forgetOtpScreen,
        path: RoutePath.forgetOtpScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child: const ForgetOtpScreen(),
            state: state,
          );
        },
      ),

      GoRoute(
        name: RoutePath.resetPasswordScreen,
        path: RoutePath.resetPasswordScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child: const ResetPasswordScreen(),
            state: state,
          );
        },
      ),

      GoRoute(
        name: RoutePath.welcomeBackScreen,
        path: RoutePath.welcomeBackScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child: const WelcomeBackScreen(),
            state: state,
          );
        },
      ),
      GoRoute(
        name: RoutePath.homeScreen,
        path: RoutePath.homeScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child: const HomeScreen(),
            state: state,
          );
        },
      ),
      GoRoute(
        name: RoutePath.resultScreen,
        path: RoutePath.resultScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child: const ResultScreen(),
            state: state,
          );
        },
      ),
      GoRoute(
        name: RoutePath.resultSummaryScreen,
        path: RoutePath.resultSummaryScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child: const ResultSummaryScreen(),
            state: state,
          );
        },
      ),
      GoRoute(
        name: RoutePath.saveScreen,
        path: RoutePath.saveScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child: const SaveScreen(),
            state: state,
          );
        },
      ),

      /*GoRoute(
        name: RoutePath.categoryEventsScreen,
        path: RoutePath.categoryEventsScreen.addBasePath,
        pageBuilder: (context, state) {
          final extra = state.extra;
          final map = (extra is Map<String, dynamic>) ? extra : {};

          final id = map['id'] as String? ?? '';
          final title = map['title'] as String? ?? '';

          return _buildPageWithAnimation(
            child: CategoryEventsScreen(id: id, title: title),
            state: state,
          );
        },
      ),*/
    ],
  );

  static CustomTransitionPage _buildPageWithAnimation({
    required Widget child,
    required GoRouterState state,
  }) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionDuration: const Duration(milliseconds: 400),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        var tween = Tween(begin: begin, end: end);
        var offsetAnimation = animation.drive(tween);
        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }

  static GoRouter get route => initRoute;
}
