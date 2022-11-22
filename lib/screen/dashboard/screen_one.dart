import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:petcentral_web_admin/screen/dashboard/screen_modular/screen_customer.dart';
import 'package:petcentral_web_admin/screen/dashboard/screen_modular/screen_grooming.dart';
import 'package:petcentral_web_admin/screen/dashboard/screen_modular/screen_booking_hotel.dart';
import 'package:petcentral_web_admin/screen/dashboard/screen_modular/screen_all_pet.dart';
import 'package:petcentral_web_admin/screen/dashboard/screen_modular/service_screen.dart';
import 'package:petcentral_web_admin/screen/dashboard/screen_modular/screen_5.dart';
import 'package:petcentral_web_admin/screen/dashboard/screen_modular/screen_6.dart';
import 'package:petcentral_web_admin/screen/dashboard/screen_modular/screen_message.dart';
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
        // final pageTitle = _getTitleByIndex(controller.selectedIndex);
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
            return GetAllPet();
          case 5:
            return ServiceScreen();
          case 6:
            return ScreenEnam();
          default:
            return Text(
              'Not Found',
              style: theme.textTheme.headlineSmall,
            );
        }
      },
    );
  }
}
