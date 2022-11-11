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

class DetailsReservationScreen extends HookConsumerWidget {
  var id;
  var userName;

  DetailsReservationScreen(
      {super.key, required this.id, required this.userName});
  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();

  Future<void> acceptRes(int id) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'PUT',
        Uri.parse(
            'https://api.petcentral.id/admin/reservation/hotel/update-status'));
    request.body = json.encode({"reservationId": id, "status": "approved"});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      debugPrint(await response.stream.bytesToString());
      Get.offAll(DashBoardScreenX(keys: _key, controller: _controller));
      // ref.refresh(groomingDataPending);
      Get.snackbar(
        'Success',
        'Update Success',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } else {
      debugPrint(response.reasonPhrase);
      Get.snackbar(
        'Error',
        'Please try again',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  Future<void> rejectRes(int id) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'PUT',
        Uri.parse(
            'https://api.petcentral.id/admin/reservation/hotel/update-status'));
    request.body = json.encode({"reservationId": id, "status": "rejected"});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      debugPrint(await response.stream.bytesToString());
      Get.offAll(DashBoardScreenX(keys: _key, controller: _controller));
      // ref.refresh(groomingDataPending);
      Get.snackbar(
        'Success',
        'Update Success',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } else {
      debugPrint(response.reasonPhrase);
      Get.snackbar(
        'Error',
        'Please try again',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hotelData = ref.watch(reservationDetails(id));
    return Scaffold(
      body: hotelData.when(
          data: (data) {
            return Center(
              child: SizedBox(
                height: 95.h,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            const Gap(30),
                            (data.status == 'pending' &&
                                    data.status != 'approved')
                                ? SizedBox(
                                    width: 20.w,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                            width: 8.w,
                                            height: 3.w,
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.greenAccent),
                                              onPressed: () {
                                                acceptRes(data.id!.toInt());
                                              },
                                              child: Text(
                                                'Accept',
                                                style: GoogleFonts.livvic(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                    color: Colors.white),
                                              ),
                                            )),
                                        const Gap(20),
                                        SizedBox(
                                            width: 8.w,
                                            height: 3.w,
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.redAccent),
                                              onPressed: () {
                                                rejectRes(data.id!.toInt());
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
                              Icons.home,
                              size: 20,
                            ),
                            const Gap(20),
                            Text(
                              '${data.serviceType!.type}',
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
                                'Check In ',
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
                                '${data.dateCheckIn}',
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
                                'Check Out ',
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
                                '${data.dateCheckOut}',
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
                                'Price Range',
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
                                'Rp. ${data.minCost} - Rp. ${data.maxCost}',
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
                              Icons.details,
                              size: 20,
                            ),
                            const Gap(20),
                            Text(
                              'Details',
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
                                'Cust Name ',
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
                                '${data.customer!.name}',
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
                                'Cust Phone Number ',
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
                                '+62 ${data.customer!.mobilePhone}',
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
                                'Cust Address ',
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
                                '${data.customer!.homeAddress}',
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
                              'Pet Details',
                              style: GoogleFonts.livvic(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        const Gap(10),
                        Container(
                          width: 80.w,
                          height: 25.h,
                          // color: Colors.red,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: data.petInRoom!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return SizedBox(
                                width: 400,
                                height: 100,
                                child: Card(
                                  shadowColor: Colors.blueAccent,
                                  color: Colors.grey.shade200,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 100,
                                          child: Icon(
                                            Icons.pets_rounded,
                                            size: 80,
                                          ),
                                          // child: Image.network(data
                                          //     .petInRoom![index]
                                          //     .pet!
                                          //     .breed!
                                          //     .pictures!),
                                        ),
                                        const Gap(20),
                                        Column(
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: 5.w,
                                                  child: Text(
                                                    'Type ',
                                                    style: GoogleFonts.livvic(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 12,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 1.w,
                                                  child: Text(
                                                    ':',
                                                    style: GoogleFonts.livvic(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 12,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 8.w,
                                                  child: Text(
                                                    '${data.petInRoom![index].pet!.type}',
                                                    style: GoogleFonts.livvic(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 12,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const Gap(10),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: 5.w,
                                                  child: Text(
                                                    'Name ',
                                                    style: GoogleFonts.livvic(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 12,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 1.w,
                                                  child: Text(
                                                    ':',
                                                    style: GoogleFonts.livvic(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 12,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 8.w,
                                                  child: Text(
                                                    '${data.petInRoom![index].pet!.name}',
                                                    style: GoogleFonts.livvic(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 12,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const Gap(10),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: 5.w,
                                                  child: Text(
                                                    'Weight ',
                                                    style: GoogleFonts.livvic(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 12,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 1.w,
                                                  child: Text(
                                                    ':',
                                                    style: GoogleFonts.livvic(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 12,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 8.w,
                                                  child: Text(
                                                    '${data.petInRoom![index].pet!.weight} Kg',
                                                    style: GoogleFonts.livvic(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 12,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const Gap(10),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: 5.w,
                                                  child: Text(
                                                    'Gender ',
                                                    style: GoogleFonts.livvic(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 12,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 1.w,
                                                  child: Text(
                                                    ':',
                                                    style: GoogleFonts.livvic(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 12,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 8.w,
                                                  child: Text(
                                                    '${data.petInRoom![index].pet!.gender}',
                                                    style: GoogleFonts.livvic(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 12,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const Gap(10),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: 5.w,
                                                  child: Text(
                                                    'Breed ',
                                                    style: GoogleFonts.livvic(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 12,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 1.w,
                                                  child: Text(
                                                    ':',
                                                    style: GoogleFonts.livvic(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 12,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 8.w,
                                                  child: Text(
                                                    '${data.petInRoom![index].pet!.breed!.name}',
                                                    style: GoogleFonts.livvic(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 12,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const Gap(10),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
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
