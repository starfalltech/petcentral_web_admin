import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class AppbarLoginWidget extends StatelessWidget {
  const AppbarLoginWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: const Color(
              0xff898989,
            ).withOpacity(0.08),
            blurRadius: 32,
            offset: const Offset(0, 2))
      ]),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 23.0, bottom: 23, left: 42),
            child: Image.asset(
              'assets/images/admin_logo.png',
              fit: BoxFit.contain,
            ),
          ),
          const Spacer(flex: 2),
          Text(
            'Admin Dashboard',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 22,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
