import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:petcentral_web_admin/core/common/color_values.dart';
import 'package:sizer/sizer.dart';
class IconButtonChatWidget extends StatelessWidget {
  final VoidCallback onTap;
  const IconButtonChatWidget({
    Key? key, required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(2.sp),
        decoration: BoxDecoration(
            color: ColorValues.primaryBlue,
            borderRadius:
            BorderRadius.circular(8)),
        child: SvgPicture.asset(
          'assets/icons/icon_chat_white.svg',
          width: 4.2.sp,
          height: 4.2.sp,
        ),
      ),
    );
  }
}
