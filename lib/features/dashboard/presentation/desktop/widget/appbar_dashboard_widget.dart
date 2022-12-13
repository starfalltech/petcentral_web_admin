import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petcentral_web_admin/core/common/color_values.dart';
import 'package:petcentral_web_admin/core/platform/local_auth_storage/auth_storage.dart';
import 'package:petcentral_web_admin/features/auth/presentation/desktop/login_page.dart';
import 'package:petcentral_web_admin/widget/primary_button.dart';
import 'package:sizer/sizer.dart';

class AppbarDashBoardWidget extends StatelessWidget with PreferredSizeWidget {
  const AppbarDashBoardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/icons/icon_notification.svg',
            width: 5.sp,
            height: 5.sp,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 32.0,
              right: 16,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'John Doe',
                  style: GoogleFonts.poppins(
                    fontSize: 2.8.sp,
                    fontWeight: FontWeight.w500,
                    color: ColorValues.fontBlack,
                  ),
                ),
                Text(
                  'ADMIN',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 2.sp,
                  ),
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(
                    'Admin Profile',
                    style: GoogleFonts.poppins(
                      fontSize: 3.sp,
                      fontWeight: FontWeight.w500,
                      color: ColorValues.fontBlack,
                    ),
                  ),
                  backgroundColor: Colors.white,
                  actions: [
                    PrimaryButton(
                      onPress: () async {
                        await AuthStorage().deleteAuthStorage('id');
                        await AuthStorage()
                            .deleteAuthStorage('branchId')
                            .then((value) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          );
                        });
                      },
                      txtButton: 'Logout',
                    )
                  ],
                ),
              );
            },
            child: Padding(
              padding: EdgeInsets.only(
                right: 9.w,
              ),
              child: SvgPicture.asset(
                'assets/icons/icon_arrow_down.svg',
                width: 4.sp,
                height: 4.sp,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.infinity, 80);
}
