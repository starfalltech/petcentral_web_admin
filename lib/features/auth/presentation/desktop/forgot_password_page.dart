import 'package:flutter/material.dart';
import 'package:petcentral_web_admin/features/auth/presentation/widget/forgot_form_widget.dart';
import 'package:sizer/sizer.dart';
class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    'assets/images/bg_landing_blue.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  top: 30.h,
                  left: 12.w,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/hand_pet_large.png',
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: MediaQuery.of(context).size.width * 0.25,
                        fit: BoxFit.fill,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Expanded(
            child: ForgotFormWidget(),
          ),
        ],
      ),
    );
  }
}
