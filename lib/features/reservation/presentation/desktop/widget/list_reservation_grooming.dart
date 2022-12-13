import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petcentral_web_admin/widget/widget.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/common/color_values.dart';

class ListReservationGrooming extends StatelessWidget {
  final Map<String, dynamic> summary;

  const ListReservationGrooming({
    Key? key,
    required this.summary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0),
      child: Row(
        children: [
          ContainerShadowWidget(
            width: 40.sp,
            padding: EdgeInsets.all(3.5.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'assets/icons/icon_circle_home_yellow.svg',
                  width: 6.sp,
                  height: 6.sp,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                    bottom: 7,
                  ),
                  child: Text(
                    summary['pendingGrooming'].toString(),
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 4.sp,
                      color: ColorValues.warningYellow,
                    ),
                  ),
                ),
                Text(
                  'Pending',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 2.4.sp,
                    color: ColorValues.grey,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: 4.sp,
          ),
          ContainerShadowWidget(
            width: 40.sp,
            padding: EdgeInsets.all(3.5.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'assets/icons/icon_circle_home_green.svg',
                  width: 6.sp,
                  height: 6.sp,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                    bottom: 7,
                  ),
                  child: Text(
                    summary['approvedGrooming'].toString(),
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 4.sp,
                      color: ColorValues.succesGreen,
                    ),
                  ),
                ),
                Text(
                  'Approved',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 2.4.sp,
                    color: ColorValues.grey,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: 4.sp,
          ),
          ContainerShadowWidget(
            width: 40.sp,
            padding: EdgeInsets.all(3.5.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'assets/icons/icon_circle_home_red.svg',
                  width: 6.sp,
                  height: 6.sp,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                    bottom: 7,
                  ),
                  child: Text(
                    summary['rejectedGrooming'].toString(),
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 4.sp,
                      color: ColorValues.dangerRed,
                    ),
                  ),
                ),
                Text(
                  'Rejected',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 2.4.sp,
                    color: ColorValues.grey,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
