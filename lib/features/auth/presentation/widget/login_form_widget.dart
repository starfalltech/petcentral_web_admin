import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petcentral_web_admin/core/common/color_values.dart';
import 'package:petcentral_web_admin/core/router/app_routers.dart';
import 'package:petcentral_web_admin/features/auth/presentation/logic/cubit/login_cubit.dart';
import 'package:petcentral_web_admin/features/auth/presentation/logic/login_state.dart';
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
  final _keyForm = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginEvent = BlocProvider.of<LoginCubit>(context);

    return Scaffold(
      appBar: const AppbarLoginWidget(),
      body: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          // TODO: implement listener

          if (state is SuccesLoginState) {
            Navigator.of(context).pushReplacementNamed(AppRouters.dashboard);
          }
          if (state is FailureLoginState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: ColorValues.dangerRed,
                content: Text(
                  'Error : ${state.msg}',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 3.7.sp,
                  ),
                ),
              ),
            );
          }
        },
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
            child: SingleChildScrollView(
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
                  Form(
                    key: _keyForm,
                    child: Column(
                      children: [
                        TextFieldLoginWidget(
                          title: 'Email Address',
                          emailInput: true,
                          passwordInput: false,
                          controller: email,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          hint: 'Write an email address',
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_keyForm.currentState!.validate()) {
                        loginEvent.login(
                            email: email.text, password: password.text);
                      }
                    },
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
                              color: ColorValues.grey),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(AppRouters.forgotPassword);
                          },
                          child: Text(
                            'Reset Password',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: ColorValues.primaryBlue),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
