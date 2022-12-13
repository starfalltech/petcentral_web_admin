import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';
import 'package:petcentral_web_admin/core/common/app_theme_data.dart';
import 'package:petcentral_web_admin/core/router/app_routers.dart';
import 'package:petcentral_web_admin/global_bloc_observer.dart';
import 'package:sizer/sizer.dart';
import 'package:url_strategy/url_strategy.dart';

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    debugPrint('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}

void main() {
  setPathUrlStrategy();
  Bloc.observer = GlobalBlocObserver();
  _setupLogging();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        initialRoute: AppRouters.splash,
        routes: AppRouters().router,
        debugShowCheckedModeBanner: false,
        theme: AppThemeData.getTheme(context),
      );
    });
  }
}
