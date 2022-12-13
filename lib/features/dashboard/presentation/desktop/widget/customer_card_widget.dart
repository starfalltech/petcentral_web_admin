import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/common/color_values.dart';
import 'widget.dart';

class CustomerCardWidget extends StatefulWidget {
  const CustomerCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomerCardWidget> createState() => _CustomerCardWidgetState();
}

class _CustomerCardWidgetState extends State<CustomerCardWidget> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      onHover: (value) {
        setState(() {
          isHover = value;
        });
      },
      child: Container(
        padding: EdgeInsets.all(
          2.sp,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              isHover ? BorderRadius.circular(8) : BorderRadius.circular(0),
          boxShadow: [
            if (isHover)
              BoxShadow(
                color: const Color(0xff898989).withOpacity(
                  0.08,
                ),
                offset: const Offset(0, 2),
                blurRadius: 32,
              )
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 5.sp),
              child: Text(
                'CST001',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 2.4.sp,
                  color: ColorValues.grey,
                ),
              ),
            ),
            Icon(
              Icons.account_circle,
              size: 8.sp,
              color: ColorValues.grey,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 8.0,
                right: 5.sp,
              ),
              child: Text(
                'Customer 1',
                style: GoogleFonts.poppins(
                    fontSize: 2.8.sp,
                    fontWeight: FontWeight.w600,
                    color: ColorValues.primaryBlue),
              ),
            ),
            const VerifiedLabelWidget(),
            const Spacer(),
            Text(
              '5 Minutes ago',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 2.4.sp,
                color: ColorValues.grey,
              ),
            )
          ],
        ),
      ),
    );
  }
}
