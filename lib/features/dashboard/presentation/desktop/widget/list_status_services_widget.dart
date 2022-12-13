import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/common/color_values.dart';
import '../../../../../widget/widget.dart';

class ListStatusServicesWidget extends StatelessWidget {
  const ListStatusServicesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0),
      child: Row(
        children: [
          Expanded(
            child: ContainerShadowWidget(
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
                      '15',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 4.sp,
                        color: ColorValues.warningYellow,
                      ),
                    ),
                  ),
                  Text(
                    'Pending Hotel Booking',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 2.4.sp,
                      color: ColorValues.grey,
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 4.sp,
          ),
          Expanded(
            child: ContainerShadowWidget(
              padding: EdgeInsets.all(3.5.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    'assets/icons/icon_circle_home_blue.svg',
                    width: 6.sp,
                    height: 6.sp,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                      bottom: 7,
                    ),
                    child: Text(
                      '15',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 4.sp,
                        color: ColorValues.primaryBlue,
                      ),
                    ),
                  ),
                  Text(
                    'Ongoing Hotel Booking',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 2.4.sp,
                      color: ColorValues.grey,
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 4.sp,
          ),
          Expanded(
            child: ContainerShadowWidget(
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
                      '15',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 4.sp,
                        color: ColorValues.warningYellow,
                      ),
                    ),
                  ),
                  Text(
                    'Pending Grooming',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 2.4.sp,
                      color: ColorValues.grey,
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 4.sp,
          ),
          Expanded(
            child: ContainerShadowWidget(
              padding: EdgeInsets.all(3.5.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    'assets/icons/icon_circle_home_blue.svg',
                    width: 6.sp,
                    height: 6.sp,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                      bottom: 7,
                    ),
                    child: Text(
                      '15',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 4.sp,
                        color: ColorValues.primaryBlue,
                      ),
                    ),
                  ),
                  Text(
                    'Total Customer',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 2.4.sp,
                      color: ColorValues.grey,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
