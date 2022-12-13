import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.onPress,
    required this.txtButton,
  }) : super(key: key);
  final VoidCallback onPress;
  final String txtButton;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: const LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Color(0xff3399F2),
              Color(0xff68B2F7),
            ],
          ),
        ),
        child: SizedBox(
          width: double.infinity,
          height: 48,
          child: Center(
            child: Text(
              txtButton,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 2.7.sp,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
