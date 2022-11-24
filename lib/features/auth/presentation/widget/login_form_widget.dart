import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petcentral_web_admin/core/common/color_values.dart';
import 'package:petcentral_web_admin/features/auth/presentation/widget/textfield_login_widget.dart';
import 'package:sizer/sizer.dart';

import 'appbar_login_widget.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({Key? key}) : super(key: key);

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AppbarLoginWidget(),
          Container(
            width: 32.w,
            margin: EdgeInsets.only(top: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello,welcome back! 👋',
                  style: GoogleFonts.poppins(
                    fontSize: 34,
                    fontWeight: FontWeight.w700,
                    color: ColorValues.fontBlack,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 16.0,
                    bottom: 50,
                  ),
                  child: Text(
                    'Please fill all information below to login into Admin Dashboard.',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: ColorValues.grey,
                    ),
                  ),
                ),
                TextFieldLoginWidget(
                  title: 'Email Address',
                  controller: email,
                  hint: 'Write an email address',
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFieldLoginWidget(
                  title: 'Password',
                  controller: password,
                  hint: 'Write a password',
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Login',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Forgot password? ',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: ColorValues.grey
                        ),
                      ),
                      Text(
                        'Reset Password',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: ColorValues.primaryBlue),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
