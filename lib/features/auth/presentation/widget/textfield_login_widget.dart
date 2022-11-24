import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petcentral_web_admin/core/common/color_values.dart';

class TextFieldLoginWidget extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController controller;

  const TextFieldLoginWidget(
      {Key? key,
      required this.title,
      required this.controller,
      required this.hint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: '$title ',
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: ColorValues.fontBlack),
            children: [
              TextSpan(
                text: "*",
                style: GoogleFonts.poppins(
                  color: ColorValues.dangerRed,
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 8,),
        TextField(
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: ColorValues.fontBlack,
          ),
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  8,
                ),
                borderSide: BorderSide(
                  color: const Color(0xff979797).withOpacity(0.5),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  8,
                ),
                borderSide: BorderSide(
                  color: const Color(0xff979797).withOpacity(0.5),
                ),
              ),
              hintText: hint,
              hintStyle: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: ColorValues.grey,
              ),
              isDense: true,
              contentPadding: const EdgeInsets.all(12)),
        )
      ],
    );
  }
}
