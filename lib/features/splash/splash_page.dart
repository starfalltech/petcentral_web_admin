import 'package:flutter/material.dart';
import 'package:petcentral_web_admin/features/auth/presentation/desktop/login_page.dart';

import '../../core/platform/local_auth_storage/auth_storage.dart';
import '../dashboard/presentation/desktop/dashboard_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(milliseconds: 500),
          () async{
        await AuthStorage().readAuthStorage('id').then((value) {
          debugPrint(value);
          if (value.isNotEmpty) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const DashBoardPage(),
              ),
            );
          }else{
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginPage(),
              ),
            );
          }
        });
      },
    );
    return Scaffold(
      body: Container(
        color: Colors.white,
      ),
    );
  }
}
