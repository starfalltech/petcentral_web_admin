import 'package:go_router/go_router.dart';
import 'package:petcentral_web_admin/features/auth/presentation/screens/login_page.dart';

class AppRouters {
  static const String login = "/";

  final router = GoRouter(
    routes: [
      GoRoute(
        path: login,
        builder: (context, state) => const LoginPage(),
      )
    ],
  );
}
