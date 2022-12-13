import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petcentral_web_admin/core/common/color_values.dart';
import 'package:petcentral_web_admin/features/auth/presentation/widget/succes_reset_password_widget.dart';
import 'package:petcentral_web_admin/features/auth/presentation/widget/textfield_login_widget.dart';

import 'appbar_login_widget.dart';

class ResetFormWidget extends StatefulWidget {
  const ResetFormWidget({Key? key}) : super(key: key);

  @override
  State<ResetFormWidget> createState() => _ResetFormWidgetState();
}

class _ResetFormWidgetState extends State<ResetFormWidget> {
  final TextEditingController newPassword = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool succsResetPass = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppbarLoginWidget(),
        body: succsResetPass
            ? const SuccesResetPasswordWidget()
            : Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Reset Password',
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
                            'Please fill with email address then we will send reset link to the email.',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: ColorValues.grey,
                            ),
                          ),
                        ),
                        TextFieldLoginWidget(
                          title: 'Email Address',
                          emailInput: false,
                          passwordInput: true,
                          controller: newPassword,
                          hint: 'Write an new password',
                          validator: (value){
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFieldLoginWidget(
                          title: 'Password',
                          emailInput: false,
                          passwordInput: true,
                          controller: password,
                          hint: 'Write a password',
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
                            setState(() {
                              succsResetPass = true;
                            });
                          },
                          child: Text(
                            'Reset Password',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ));
  }
}
