import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../widget/login_form_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/bg_landing_blue.png',
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                    top: 25.h,
                    left: 15.w,
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/hand_pet_large.png',
                          width: MediaQuery.of(context).size.width * 0.2,
                          height:MediaQuery.of(context).size.width * 0.25,
                          fit: BoxFit.fill,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Expanded(
            child: LoginFormWidget(),
          ),
        ],
      ),
    );
  }
}
