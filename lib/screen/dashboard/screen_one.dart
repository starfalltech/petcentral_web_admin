import 'package:flutter/material.dart';
import 'package:petcentral_web_admin/screen/dashboard/screen_modular/screen_1.dart';
import 'package:petcentral_web_admin/screen/dashboard/screen_modular/screen_2.dart';
import 'package:petcentral_web_admin/screen/dashboard/screen_modular/screen_3.dart';
import 'package:petcentral_web_admin/screen/dashboard/screen_modular/screen_4.dart';
import 'package:petcentral_web_admin/screen/dashboard/screen_modular/screen_5.dart';
import 'package:petcentral_web_admin/screen/dashboard/screen_modular/screen_6.dart';
import 'package:sidebarx/sidebarx.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SidebarXController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final pageTitle = _getTitleByIndex(controller.selectedIndex);
        switch (controller.selectedIndex) {
          case 0:
            return ListView.builder(
              padding: const EdgeInsets.only(top: 10),
              itemBuilder: (context, index) => Container(
                height: 100,
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).canvasColor,
                  boxShadow: const [BoxShadow()],
                ),
              ),
            );
          case 1:
            return ScreenSatu();
          case 2:
            return ScreenDua();
          case 3:
            return ScreenTiga();
          case 4:
            return ScreenEmpat();
          case 5:
            return ScreenLima();
          case 6:
            return ScreenEnam();
          default:
            return Text(
              pageTitle,
              style: theme.textTheme.headlineSmall,
            );
        }
      },
    );
  }
}

String _getTitleByIndex(int index) {
  switch (index) {
    case 0:
      return 'Home';
    case 1:
      return 'Search';
    case 2:
      return 'People';
    case 3:
      return 'Favorites';
    case 4:
      return 'Custom iconWidget';
    case 5:
      return 'Profile';
    case 6:
      return 'Settings';
    default:
      return 'Not found page';
  }
}
