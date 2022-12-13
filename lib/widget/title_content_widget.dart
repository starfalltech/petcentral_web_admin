import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../core/common/color_values.dart';

class TitleContentWidget extends StatelessWidget {
  final String mainTitle;
  final String parentPath;
  final String childPath;

  const TitleContentWidget({
    Key? key,
    required this.mainTitle,
    required this.parentPath,
    required this.childPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          mainTitle,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 4.sp,
          ),
        ),
        Row(
          children: [
            Text(
              parentPath,
              style: GoogleFonts.poppins(
                  fontSize: 2.8.sp,
                  fontWeight: FontWeight.w500,
                  color: ColorValues.primaryBlue),
            ),
            Text(
              childPath,
              style: GoogleFonts.poppins(
                  fontSize: 2.8.sp,
                  fontWeight: FontWeight.w500,
                  color: ColorValues.grey),
            ),
          ],
        )
      ],
    );
  }
}
