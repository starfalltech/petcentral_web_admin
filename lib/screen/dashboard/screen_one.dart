import 'package:flutter/material.dart';
import 'package:petcentral_web_admin/screen/dashboard/screen_modular/screen_0.dart';
import 'package:petcentral_web_admin/screen/dashboard/screen_modular/screen_1.dart';
import 'package:petcentral_web_admin/screen/dashboard/screen_modular/screen_2.dart';
import 'package:petcentral_web_admin/screen/dashboard/screen_modular/screen_3.dart';
import 'package:petcentral_web_admin/screen/dashboard/screen_modular/screen_4.dart';
import 'package:petcentral_web_admin/screen/dashboard/screen_modular/screen_5.dart';
import 'package:petcentral_web_admin/screen/dashboard/screen_modular/screen_6.dart';
import 'package:petcentral_web_admin/screen/message/message_page.dart';
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
            return CustomerListScreen();
          case 1:
            return GroomingReservationScreen();
          case 2:
            return BookingListScreen();
          case 3:
            return MessagePage();
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
