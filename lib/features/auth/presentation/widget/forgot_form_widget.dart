import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petcentral_web_admin/features/auth/presentation/widget/textfield_login_widget.dart';

import '../../../../core/common/color_values.dart';
import '../../../../core/router/app_routers.dart';
import 'appbar_login_widget.dart';

class ForgotFormWidget extends StatefulWidget {
  const ForgotFormWidget({Key? key}) : super(key: key);

  @override
  State<ForgotFormWidget> createState() => _ForgotFormWidgetState();
}

class _ForgotFormWidgetState extends State<ForgotFormWidget> {
  final TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarLoginWidget(),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.3,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Forgot Password',
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
                    'Please fill with email address then we will send reset link to the email.  ',
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
                  emailInput: true,
                  passwordInput: false,
                  hint: 'Write an email address',
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(AppRouters.resetPassword);
                  },
                  child: Text(
                    'Send Link',
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .pop(AppRouters.login);
                    },
                    child: Text(
                      'Back To Login',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                          color: ColorValues.primaryBlue),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
