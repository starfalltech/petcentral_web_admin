import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcentral_web_admin/const/colors_const.dart';
import 'package:petcentral_web_admin/screen/dashboard/dashboard_screen.dart';
import 'package:petcentral_web_admin/screen/dashboard/screen_one.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(Sizer(
    builder: ((context, orientation, deviceType) {
      return MyApp();
    }),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pet Central',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        canvasColor: canvasColor,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            color: Colors.white,
            fontSize: 46,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      home: Builder(
        builder: (context) {
          final isSmallScreen = Get.width < 600;
          return Scaffold(
            key: _key,
            appBar: isSmallScreen
                ? AppBar(
                    backgroundColor: canvasColor,
                    // title: Text(_getTitleByIndex(_controller.selectedIndex)),
                    leading: IconButton(
                      onPressed: () {
                        _key.currentState?.openDrawer();
                      },
                      icon: const Icon(Icons.menu),
                    ),
                  )
                : null,
            drawer: DrawerSidebarX(controller: _controller),
            body: Row(
              children: [
                if (!isSmallScreen) DrawerSidebarX(controller: _controller),
                Expanded(
                  child: Center(
                    child: ScreenOne(
                      controller: _controller,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
