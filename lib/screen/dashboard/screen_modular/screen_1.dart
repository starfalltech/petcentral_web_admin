import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class ScreenSatu extends StatelessWidget {
  const ScreenSatu({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 10),
      itemBuilder: (context, index) => Container(
        height: 100,
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).canvasColor,
          boxShadow: const [BoxShadow()],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Gap(20),
                Icon(
                  Icons.person,
                  size: 3.w,
                  color: Colors.white,
                ),
                const Gap(20),
                Text(
                  'Nama Retail',
                  style: GoogleFonts.livvic(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 10.w,
                  height: 5.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.amber,
                  ),
                ),
                const Gap(20),
                Container(
                  width: 10.w,
                  height: 5.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                  ),
                ),
                const Gap(20),
                Container(
                  width: 10.w,
                  height: 5.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.orange,
                  ),
                ),
                const Gap(20),
              ],
            )
          ],
        ),
      ),
    );
  }
}
