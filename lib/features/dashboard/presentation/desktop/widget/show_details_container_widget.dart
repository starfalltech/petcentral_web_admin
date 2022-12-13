import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petcentral_web_admin/core/common/color_values.dart';
import 'package:sizer/sizer.dart';

class ShowDetailsContainerWidget extends StatefulWidget {
  const ShowDetailsContainerWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ShowDetailsContainerWidget> createState() =>
      _ShowDetailsContainerWidgetState();
}

class _ShowDetailsContainerWidgetState
    extends State<ShowDetailsContainerWidget> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isClicked = !isClicked;
        });
      },
      child: Container(
        padding: EdgeInsets.all(2.sp),
        color: ColorValues.grey.withOpacity(
          0.08,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Show Pet Details:',
                  style: GoogleFonts.poppins(
                    fontSize: 3.sp,
                    fontWeight: FontWeight.w500,
                    color: ColorValues.grey,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 13.0),
                  child: Transform.rotate(
                    angle: isClicked ? 91.1 : 0,
                    child: SvgPicture.asset(
                      'assets/icons/icon_arrow_down.svg',
                      width: 4.sp,
                      height: 4.sp,
                    ),
                  ),
                )
              ],
            ),
            if (isClicked)
              Padding(
                padding: EdgeInsets.only(top: 2.sp),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                          color: ColorValues.grey.withOpacity(
                            0.2,
                          ),
                          borderRadius: BorderRadius.circular(
                            4,
                          )),
                      child: Text(
                        'Pet: Cat',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 2.8.sp,
                          color: ColorValues.grey,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 2.sp,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                          color: ColorValues.grey.withOpacity(
                            0.2,
                          ),
                          borderRadius: BorderRadius.circular(
                            4,
                          )),
                      child: Text(
                        'Name: Loly',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 2.8.sp,
                          color: ColorValues.grey,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 2.sp,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                          color: ColorValues.grey.withOpacity(
                            0.2,
                          ),
                          borderRadius: BorderRadius.circular(
                            4,
                          )),
                      child: Text(
                        'Breeds: Chatreux',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 2.8.sp,
                          color: ColorValues.grey,
                        ),
                      ),
                    )
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
