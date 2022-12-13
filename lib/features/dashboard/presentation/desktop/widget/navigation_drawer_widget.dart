import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petcentral_web_admin/core/common/color_values.dart';
import 'package:petcentral_web_admin/features/dashboard/presentation/logic/cubit/select_page_cubit.dart';
import 'package:sizer/sizer.dart';

class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 25.w,
      child: Padding(
        padding: EdgeInsets.only(
          left: 8.w,
          right: 2.w,
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                right: 4.w,
              ),
              height: 80,
              child: Center(
                child: Image.asset(
                  'assets/images/admin_logo.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 6.h),
                      child: const DrawerItemWidget(
                        iconPath: 'assets/icons/icon_home.svg',
                        text: 'Dashboard',
                        value: 0,
                      ),
                    ),
                    const DrawerParentItemWidget(
                      iconPath: 'assets/icons/icon_reservation.svg',
                      text: 'Reservation',
                      value: 1,
                      childern: [
                        DrawerChildItemWidget(
                          text: 'Grooming',
                          value: 1,
                        ),
                        DrawerChildItemWidget(
                          text: 'Hotel',
                          value: 2,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerItemWidget extends StatelessWidget {
  const DrawerItemWidget({
    Key? key,
    required this.iconPath,
    required this.text,
    required this.value,
  }) : super(key: key);
  final String iconPath;
  final String text;
  final int value;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectPageCubit, int>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            context.read<SelectPageCubit>().changePage(value);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 20,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              border: state == value
                  ? Border(
                      left: BorderSide(
                          color: ColorValues.primaryBlue, width: 1.sp),
                    )
                  : Border.all(
                      width: 1.sp,
                      color: Colors.transparent,
                    ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  iconPath,
                  width: 6.sp,
                  height: 6.sp,
                  color: state == value
                      ? ColorValues.primaryBlue
                      : ColorValues.grey,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    text,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 3.sp,
                      color: state == value
                          ? ColorValues.primaryBlue
                          : ColorValues.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class DrawerParentItemWidget extends StatelessWidget {
  const DrawerParentItemWidget({
    Key? key,
    required this.iconPath,
    required this.text,
    required this.value,
    required this.childern,
  }) : super(key: key);
  final String iconPath;
  final String text;
  final int value;
  final List<Widget> childern;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectPageCubit, int>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 20,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            border: state == value || state == 1 + value || state == 1 + value
                ? Border(
                    left: BorderSide(
                      color: ColorValues.primaryBlue,
                      width: 1.sp,
                    ),
                  )
                : Border.all(
                    width: 1.sp,
                    color: Colors.transparent,
                  ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    iconPath,
                    width: 6.sp,
                    height: 6.sp,
                    color: state == value ||
                            state == 1 + value ||
                            state == 2 + value
                        ? ColorValues.primaryBlue
                        : ColorValues.grey,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      text,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 3.sp,
                        color: state == value ||
                                state == 1 + value ||
                                state == 2 + value
                            ? ColorValues.primaryBlue
                            : ColorValues.grey,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: childern,
              )
            ],
          ),
        );
      },
    );
  }
}

class DrawerChildItemWidget extends StatelessWidget {
  final String text;
  final int value;

  const DrawerChildItemWidget(
      {super.key, required this.text, required this.value});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectPageCubit, int>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            context.read<SelectPageCubit>().changePage(value);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 8.sp),
              child: Text(
                text,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 3.sp,
                  color: state == value
                      ? ColorValues.primaryBlue
                      : ColorValues.grey,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
