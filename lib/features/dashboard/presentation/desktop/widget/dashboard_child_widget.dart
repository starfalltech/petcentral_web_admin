import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petcentral_web_admin/core/common/color_values.dart';
import 'package:sizer/sizer.dart';

import '../../../../../widget/widget.dart';
import 'widget.dart';

class DashBoardChild extends StatelessWidget {
  const DashBoardChild({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleContentWidget(
          mainTitle: 'Dashboard',
          parentPath: 'Home',
          childPath: ' / Dashboard',
        ),
        const ListStatusServicesWidget(),
        SizedBox(
          height: 4.sp,
        ),
        Row(
          children: [
            Expanded(
              child: ContainerShadowWidget(
                padding: EdgeInsets.all(
                  4.2.sp,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rp15.000.000',
                          style: GoogleFonts.poppins(
                            fontSize: 4.4.sp,
                            fontWeight: FontWeight.w600,
                            color: ColorValues.succesGreen,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(
                            'Today’s Income',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 2.4.sp,
                              color: ColorValues.grey,
                            ),
                          ),
                        )
                      ],
                    ),
                    SvgPicture.asset(
                      'assets/icons/icon_circle_home_green.svg',
                      width: 6.sp,
                      height: 6.sp,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 4.sp,
            ),
            Expanded(
              child: ContainerShadowWidget(
                padding: EdgeInsets.all(
                  4.2.sp,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rp25.000.000',
                          style: GoogleFonts.poppins(
                            fontSize: 4.4.sp,
                            fontWeight: FontWeight.w600,
                            color: ColorValues.succesGreen,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(
                            'Monthly Income (Nov 2022)',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 2.4.sp,
                              color: ColorValues.grey,
                            ),
                          ),
                        )
                      ],
                    ),
                    SvgPicture.asset(
                      'assets/icons/icon_circle_home_green.svg',
                      width: 6.sp,
                      height: 6.sp,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 8.sp,
        ),
        ContainerShadowWidget(
          padding: EdgeInsets.all(
            4.2.sp,
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  bottom: 4.2.sp,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recent Customer',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 3.6.sp,
                      ),
                    ),
                    Text(
                      'See All',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 2.8.sp,
                          color: ColorValues.primaryBlue),
                    )
                  ],
                ),
              ),
              Column(
                children: List.generate(
                  5,
                  (index) => Padding(
                    padding: EdgeInsets.only(
                      bottom: index == 4 ? 0 : 16,
                    ),
                    child: const CustomerCardWidget(),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8.sp),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ContainerShadowWidget(
                  padding: EdgeInsets.all(4.2.sp),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Recent Reservation',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 3.6.sp,
                            ),
                          ),
                          Text(
                            'See All',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 2.8.sp,
                                color: ColorValues.primaryBlue),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 4.2.sp,
                      ),
                      Column(
                        children: List.generate(
                          3,
                          (index) => Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: HoverCardWidget(
                              padding: EdgeInsets.all(4.2.sp),
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Medicated (Anti Fungal / Anti Flea & Ticks)',
                                    style: GoogleFonts.poppins(
                                      fontSize: 2.8.sp,
                                      fontWeight: FontWeight.w600,
                                      color: ColorValues.fontBlack,
                                    ),
                                  ),
                                  Text(
                                    'Tue, 22 Nov 2022, 09.00 AM - 11.00 AM',
                                    style: GoogleFonts.poppins(
                                      fontSize: 2.8.sp,
                                      fontWeight: FontWeight.w500,
                                      color: ColorValues.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4.sp,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.account_circle,
                                        color: ColorValues.grey,
                                        size: 7.sp,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8.0),
                                        child: Text(
                                          'Customer 1',
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 2.8.sp,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 4.sp),
                                    child:
                                        const ShowDetailsContainerWidget(),
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const PendingLabelWidget(),
                                      const Spacer(),
                                      IconButtonAcceptWidget(
                                        onTap: () {},
                                      ),
                                      SizedBox(
                                        width: 1.6.sp,
                                      ),
                                      IconButtonRejectWidget(
                                        onTap: () {},
                                      ),
                                      SizedBox(
                                        width: 1.6.sp,
                                      ),
                                      IconButtonChatWidget(
                                        onTap: () {},
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 4.sp,
              ),
              Expanded(
                child: ContainerShadowWidget(
                  padding: EdgeInsets.all(4.2.sp),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Recent Store Sales',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 3.6.sp,
                            ),
                          ),
                          Text(
                            'See All',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 2.8.sp,
                                color: ColorValues.primaryBlue),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 4.sp,
                      ),
                      Column(
                        children: List.generate(
                          4,
                          (index) => Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: HoverCardWidget(
                              padding: EdgeInsets.all(
                                4.sp,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Medicated (Anti Fungal / Anti Flea & Ticks)',
                                    style: GoogleFonts.poppins(
                                      fontSize: 2.8.sp,
                                      fontWeight: FontWeight.w600,
                                      color: ColorValues.fontBlack,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4.sp,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.account_circle,
                                        size: 7.sp,
                                        color: ColorValues.grey,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'TR00001',
                                              style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 2.8.sp,
                                                color: ColorValues.grey,
                                              ),
                                            ),
                                            Text(
                                              'Customer 1',
                                              style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 2.8.sp,
                                                color:
                                                    ColorValues.primaryBlue,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      const Spacer(),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            'Tue, 22 Nov 2022',
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 2.4.sp,
                                              color: ColorValues.grey,
                                            ),
                                          ),
                                          Text(
                                            'IDR 75.000',
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 3.sp,
                                              color: ColorValues.primaryBlue,
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
