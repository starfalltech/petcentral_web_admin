import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:pet_central/config/common/const_variable.dart';

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
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 48)),
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
              style: GoogleFonts.manrope(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 21,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
