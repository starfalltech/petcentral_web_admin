import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:petcentral_web_admin/const/colors_const.dart';
import 'package:http/http.dart' as http;
import 'package:petcentral_web_admin/main.dart';
import 'package:petcentral_web_admin/provider/provider_services.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:sizer/sizer.dart';

class DetailsGroomingScreen extends HookConsumerWidget {
  var id;
  var userName;

  DetailsGroomingScreen({super.key, required this.id, required this.userName});
  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();

  Future<void> acceptGrooming(int resId) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'PUT',
        Uri.parse(
            'https://api.petcentral.id/admin/reservation/grooming/update-status'));
    request.body = json.encode({"reservationId": resId, "status": "approved"});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      debugPrint(await response.stream.bytesToString());
      Get.offAll(DashBoardScreenX(keys: _key, controller: _controller));
      // ref.refresh(groomingDataPending);
    } else {
      debugPrint(response.reasonPhrase);
    }
  }

  Future<void> rejectGrooming(int resId) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'PUT',
        Uri.parse(
            'https://api.petcentral.id/admin/reservation/grooming/update-status'));
    request.body = json.encode({"reservationId": resId, "status": "rejected"});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      debugPrint(await response.stream.bytesToString());
      Get.offAll(DashBoardScreenX(keys: _key, controller: _controller));
    } else {
      debugPrint(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groomingData = ref.watch(groomingDetails(id));
    return Scaffold(
      body: groomingData.when(
          data: (data) {
            return Center(
              child: SizedBox(
                height: 60.h,
                width: 70.w,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.arrow_back_ios_new_rounded,
                                size: 20,
                              ),
                              onPressed: () {
                                Get.offAll(() => DashBoardScreenX(
                                    keys: _key, controller: _controller));
                              },
                            ),
                            const Gap(20),
                            Text(
                              'Grooming Details Card',
                              style: GoogleFonts.livvic(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 24,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        const Gap(10),
                        Row(
                          children: [
                            const Icon(
                              Icons.person_outline_rounded,
                              size: 20,
                            ),
                            const Gap(20),
                            Text(
                              'Services',
                              style: GoogleFonts.livvic(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        const Gap(20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 10.w,
                              child: Text(
                                'Type of Services ',
                                style: GoogleFonts.livvic(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color: Colors.black),
                              ),
                            ),
                            SizedBox(
                              width: 2.w,
                              child: Text(
                                ':',
                                style: GoogleFonts.livvic(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color: Colors.black),
                              ),
                            ),
                            SizedBox(
                              width: 30.w,
                              child: Text(
                                '${data.serviceType!.type}',
                                style: GoogleFonts.livvic(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                        const Gap(10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 10.w,
                              child: Text(
                                'Description ',
                                style: GoogleFonts.livvic(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color: Colors.black),
                              ),
                            ),
                            SizedBox(
                              width: 2.w,
                              child: Text(
                                ':',
                                style: GoogleFonts.livvic(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color: Colors.black),
                              ),
                            ),
                            SizedBox(
                              width: 30.w,
                              child: Text(
                                '${data.serviceType!.description}',
                                style: GoogleFonts.livvic(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                        const Gap(10),
                        Row(
                          children: [
                            const Icon(
                              Icons.pets_rounded,
                              size: 20,
                            ),
                            const Gap(20),
                            Text(
                              '${data.pet!.name}',
                              style: GoogleFonts.livvic(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        const Gap(10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 10.w,
                              child: Text(
                                'Type of Pet ',
                                style: GoogleFonts.livvic(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color: Colors.black),
                              ),
                            ),
                            SizedBox(
                              width: 2.w,
                              child: Text(
                                ':',
                                style: GoogleFonts.livvic(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color: Colors.black),
                              ),
                            ),
                            SizedBox(
                              width: 30.w,
                              child: Text(
                                '${data.pet!.type}',
                                style: GoogleFonts.livvic(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                        const Gap(10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 10.w,
                              child: Text(
                                'Pet Weight ',
                                style: GoogleFonts.livvic(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color: Colors.black),
                              ),
                            ),
                            SizedBox(
                              width: 2.w,
                              child: Text(
                                ':',
                                style: GoogleFonts.livvic(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color: Colors.black),
                              ),
                            ),
                            SizedBox(
                              width: 30.w,
                              child: Text(
                                '${data.pet!.weight} KG',
                                style: GoogleFonts.livvic(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                        const Gap(10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 10.w,
                              child: Text(
                                'Pet Breed ',
                                style: GoogleFonts.livvic(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color: Colors.black),
                              ),
                            ),
                            SizedBox(
                              width: 2.w,
                              child: Text(
                                ':',
                                style: GoogleFonts.livvic(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color: Colors.black),
                              ),
                            ),
                            SizedBox(
                              width: 30.w,
                              child: Text(
                                '${data.pet!.breed!.name}',
                                style: GoogleFonts.livvic(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                        const Gap(10),
                        Row(
                          children: [
                            const Icon(
                              Icons.monetization_on,
                              size: 20,
                            ),
                            const Gap(20),
                            Text(
                              'Price Range',
                              style: GoogleFonts.livvic(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        const Gap(10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 10.w,
                              child: Text(
                                'Price Range ',
                                style: GoogleFonts.livvic(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color: Colors.black),
                              ),
                            ),
                            SizedBox(
                              width: 2.w,
                              child: Text(
                                ':',
                                style: GoogleFonts.livvic(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color: Colors.black),
                              ),
                            ),
                            SizedBox(
                              width: 30.w,
                              child: Text(
                                'Rp. ${data.minCost.toString().padLeft(3, '.')} - Rp. ${data.maxCost}',
                                style: GoogleFonts.livvic(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                        const Gap(50),
                        (data.status == 'pending')
                            ? SizedBox(
                                width: 100.w,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                        width: 10.w,
                                        height: 3.w,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Colors.greenAccent),
                                          onPressed: () {
                                            acceptGrooming(data.id!.toInt());
                                          },
                                          child: Text(
                                            'Accept',
                                            style: GoogleFonts.livvic(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12,
                                                color: Colors.white),
                                          ),
                                        )),
                                    SizedBox(
                                        width: 10.w,
                                        height: 3.w,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Colors.redAccent),
                                          onPressed: () {
                                            rejectGrooming(data.id!.toInt());
                                          },
                                          child: Text(
                                            'Reject',
                                            style: GoogleFonts.livvic(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12,
                                                color: Colors.white),
                                          ),
                                        ))
                                  ],
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          error: (e, err) {
            return Text('Error Getting Data $e && $err');
          },
          loading: () => const Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}
