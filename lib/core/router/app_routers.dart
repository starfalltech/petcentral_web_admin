
import 'package:flutter/cupertino.dart';
import 'package:petcentral_web_admin/features/splash/splash_page.dart';
import 'package:petcentral_web_admin/screens.dart';

class AppRouters {
  static const String login = "/login";
  static const String forgotPassword = "/forgot-password";
  static const String resetPassword = "/reset-password";
  static const String dashboard = "/dashboard";
  static const String splash = "/";

  final Map<String, Widget Function(BuildContext)> router = {
    splash: (context) => const SplashPage(),
    login: (context) => const LoginPage(),
    forgotPassword: (context) => const ForgotPasswordPage(),
    resetPassword: (context) => const ResetPasswordPage(),
    dashboard: (context) => const DashBoardPage(),
  };
}
