import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../core/common/color_values.dart';

class ApprovedLabelWidget extends StatelessWidget {
  const ApprovedLabelWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1.sp),
      decoration: BoxDecoration(
        color: const Color(
          0xffBCFFC2,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        'Approved',
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w500,
          fontSize: 2.8.sp,
          color: ColorValues.succesGreen,
        ),
      ),
    );
  }
}
