import 'package:flutter/material.dart';
import 'package:petcentral_web_admin/core/common/app_theme_data.dart';
import 'package:petcentral_web_admin/core/router/app_routers.dart';
import 'package:sizer/sizer.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(Sizer(
    builder: ((context, orientation, deviceType) {
      return const MyApp();
    }),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouters().router,
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.getTheme(context),
    );
  }
}
