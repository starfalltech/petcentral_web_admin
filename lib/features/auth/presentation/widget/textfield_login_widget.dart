import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petcentral_web_admin/core/common/color_values.dart';
import 'package:flutter_svg/svg.dart';

class TextFieldLoginWidget extends StatefulWidget {
  final String title;
  final String hint;
  final TextEditingController controller;
  final bool emailInput;
  final bool passwordInput;
  final String? Function(String? value) validator;

  const TextFieldLoginWidget({
    Key? key,
    required this.title,
    required this.controller,
    required this.hint,
    required this.emailInput,
    required this.passwordInput,
    required this.validator,
  }) : super(key: key);

  @override
  State<TextFieldLoginWidget> createState() => _TextFieldLoginWidgetState();
}

class _TextFieldLoginWidgetState extends State<TextFieldLoginWidget> {
  bool showPass = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: '${widget.title} ',
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
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: widget.controller,
          validator: widget.validator,
          textInputAction: TextInputAction.next,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: ColorValues.fontBlack,
          ),
          maxLines: 1,
          keyboardType: widget.emailInput
              ? TextInputType.emailAddress
              : TextInputType.text,
          obscureText: widget.passwordInput && showPass,
          decoration: InputDecoration(
              constraints: const BoxConstraints(),
              errorMaxLines: 1,
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
              suffixIcon: widget.passwordInput
                  ? FocusScope(
                      autofocus: false,
                      canRequestFocus: false,
                      skipTraversal: true,
                      child: IconButton(
                        autofocus: false,
                        onPressed: () {
                          setState(() {
                            showPass = !showPass;
                          });
                        },
                        icon:
                            SvgPicture.asset('assets/icons/icon_eye_hide.svg'),
                      ),
                    )
                  : const SizedBox.shrink(),
              hintText: widget.hint,
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
