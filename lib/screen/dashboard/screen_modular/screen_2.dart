import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:petcentral_web_admin/const/colors_const.dart';
import 'package:petcentral_web_admin/main.dart';
import 'package:petcentral_web_admin/model/reservation_detail_model.dart';
import 'package:petcentral_web_admin/provider/provider_services.dart';
import 'package:petcentral_web_admin/screen/dashboard/screen_modular/details/hotel_details.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

class BookingListScreen extends HookConsumerWidget {
  BookingListScreen({super.key});

  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, ref) {
    final isPending = useState<bool>(true);
    final isApproved = useState<bool>(false);
    final isRejected = useState<bool>(false);
    final reserveDataPending = ref.watch(reservationListPending);
    final reserveDataApproved = ref.watch(reservationListApproved);
    final reserveDataRejected = ref.watch(reservationListRejected);

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

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: 80.w,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    isPending.value = true;
                    isApproved.value = false;
                    isRejected.value = false;
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: (isPending.value == true)
                            ? canvasColor
                            : accentCanvasColor,
                        borderRadius: BorderRadius.circular(20)),
                    width: 20.w,
                    height: 30,
                    child: Center(
                      child: Text(
                        'Pending',
                        style: GoogleFonts.livvic(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    isPending.value = false;
                    isApproved.value = true;
                    isRejected.value = false;
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          color: (isApproved.value == true)
                              ? canvasColor
                              : accentCanvasColor,
                          borderRadius: BorderRadius.circular(20)),
                      width: 20.w,
                      height: 30,
                      child: Center(
                        child: Text(
                          'Approve',
                          style: GoogleFonts.livvic(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      )),
                ),
                GestureDetector(
                  onTap: () {
                    isPending.value = false;
                    isApproved.value = false;
                    isRejected.value = true;
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          color: (isRejected.value == true)
                              ? canvasColor
                              : accentCanvasColor,
                          borderRadius: BorderRadius.circular(20)),
                      width: 20.w,
                      height: 30,
                      child: Center(
                        child: Text(
                          'Rejected',
                          style: GoogleFonts.livvic(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      )),
                ),
              ],
            ),
          ),
          (isPending.value == true)
              ? Expanded(
                  child: reserveDataPending.when(
                    data: (data) {
                      return ListView.builder(
                        itemCount: data.length,
                        padding: const EdgeInsets.only(top: 10),
                        itemBuilder: (context, index) => Container(
                          height: 100,
                          width: double.infinity,
                          margin: const EdgeInsets.only(
                              bottom: 10, right: 10, left: 10),
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
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 15.w,
                                        child: Text(
                                          'Service Type : ${data[index].serviceType!.type}',
                                          style: GoogleFonts.livvic(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w800,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      const Gap(10),
                                      SizedBox(
                                        width: 10.w,
                                        child: Text(
                                          'user : ${data[index].customer!.name}',
                                          style: GoogleFonts.livvic(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                      const Gap(10),
                                      SizedBox(
                                        width: 10.w,
                                        child: Text(
                                          'Number of Pets : ${data[index].numberOfPets}',
                                          style: GoogleFonts.livvic(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                      const Gap(10),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const Gap(10),
                                  SizedBox(
                                    width: 15.w,
                                    child: Text(
                                      'Check In : ${data[index].dateCheckIn}',
                                      style: GoogleFonts.livvic(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                  const Gap(10),
                                  SizedBox(
                                    width: 15.w,
                                    child: Text(
                                      'Check Out : ${data[index].dateCheckOut}',
                                      style: GoogleFonts.livvic(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                  const Gap(10),
                                ],
                              ),
                              Container(
                                width: 10.w,
                                height: 5.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.amber,
                                ),
                                child: Center(
                                  child: Text(
                                    'Status : ${data[index].status}',
                                    style: GoogleFonts.livvic(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(() => DetailsReservationScreen(
                                          id: data[index].id,
                                          userName:
                                              data[index].customer!.name));
                                    },
                                    child: Container(
                                      width: 7.w,
                                      height: 5.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.blue,
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Details',
                                          style: GoogleFonts.livvic(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Gap(20),
                                  GestureDetector(
                                    onTap: () {
                                      acceptRes(data[index].id!.toInt());
                                    },
                                    child: Container(
                                      width: 7.w,
                                      height: 5.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.green,
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Accept',
                                          style: GoogleFonts.livvic(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Gap(20),
                                  GestureDetector(
                                    onTap: () {
                                      rejectRes(data[index].id!.toInt());
                                    },
                                    child: Container(
                                      width: 7.w,
                                      height: 5.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.redAccent,
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Refuse',
                                          style: GoogleFonts.livvic(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Gap(20),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    error: (e, err) {
                      return Center(
                        child: Text('$e & $err'),
                      );
                    },
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                )
              : Container(),
          (isApproved.value == true)
              ? Expanded(
                  child: reserveDataApproved.when(
                    data: (data) {
                      return ListView.builder(
                        itemCount: data.length,
                        padding: const EdgeInsets.only(top: 10),
                        itemBuilder: (context, index) => Container(
                          height: 100,
                          width: double.infinity,
                          margin: const EdgeInsets.only(
                              bottom: 10, right: 10, left: 10),
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
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 15.w,
                                        child: Text(
                                          'Service Type : ${data[index].serviceType!.type}',
                                          style: GoogleFonts.livvic(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w800,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      const Gap(10),
                                      SizedBox(
                                        width: 10.w,
                                        child: Text(
                                          'user : ${data[index].customer!.name}',
                                          style: GoogleFonts.livvic(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                      const Gap(10),
                                      SizedBox(
                                        width: 10.w,
                                        child: Text(
                                          'Number of Pets : ${data[index].numberOfPets}',
                                          style: GoogleFonts.livvic(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                      const Gap(10),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const Gap(10),
                                  SizedBox(
                                    width: 15.w,
                                    child: Text(
                                      'Check In : ${data[index].dateCheckIn}',
                                      style: GoogleFonts.livvic(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                  const Gap(10),
                                  SizedBox(
                                    width: 15.w,
                                    child: Text(
                                      'Check Out : ${data[index].dateCheckOut}',
                                      style: GoogleFonts.livvic(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                  const Gap(10),
                                ],
                              ),
                              Container(
                                width: 10.w,
                                height: 5.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.green,
                                ),
                                child: Center(
                                  child: Text(
                                    'Status : ${data[index].status}',
                                    style: GoogleFonts.livvic(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(() => DetailsReservationScreen(
                                          id: data[index].id,
                                          userName:
                                              data[index].customer!.name));
                                    },
                                    child: Container(
                                      width: 7.w,
                                      height: 5.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.blue,
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Details',
                                          style: GoogleFonts.livvic(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Gap(20),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    error: (e, err) {
                      return Center(
                        child: Text('$e & $err'),
                      );
                    },
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                )
              : Container(),
          (isRejected.value == true)
              ? Expanded(
                  child: reserveDataRejected.when(
                    data: (data) {
                      return ListView.builder(
                        itemCount: data.length,
                        padding: const EdgeInsets.only(top: 10),
                        itemBuilder: (context, index) => Container(
                          height: 100,
                          width: double.infinity,
                          margin: const EdgeInsets.only(
                              bottom: 10, right: 10, left: 10),
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
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 15.w,
                                        child: Text(
                                          'Service Type : ${data[index].serviceType!.type}',
                                          style: GoogleFonts.livvic(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w800,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      const Gap(10),
                                      SizedBox(
                                        width: 10.w,
                                        child: Text(
                                          'user : ${data[index].customer!.name}',
                                          style: GoogleFonts.livvic(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                      const Gap(10),
                                      SizedBox(
                                        width: 10.w,
                                        child: Text(
                                          'Number of Pets : ${data[index].numberOfPets}',
                                          style: GoogleFonts.livvic(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                      const Gap(10),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const Gap(10),
                                  SizedBox(
                                    width: 15.w,
                                    child: Text(
                                      'Check In : ${data[index].dateCheckIn}',
                                      style: GoogleFonts.livvic(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                  const Gap(10),
                                  SizedBox(
                                    width: 15.w,
                                    child: Text(
                                      'Check Out : ${data[index].dateCheckOut}',
                                      style: GoogleFonts.livvic(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                  const Gap(10),
                                ],
                              ),
                              Container(
                                width: 10.w,
                                height: 5.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.red,
                                ),
                                child: Center(
                                  child: Text(
                                    'Status : ${data[index].status}',
                                    style: GoogleFonts.livvic(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(() => DetailsReservationScreen(
                                          id: data[index].id,
                                          userName:
                                              data[index].customer!.name));
                                    },
                                    child: Container(
                                      width: 7.w,
                                      height: 5.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.blue,
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Details',
                                          style: GoogleFonts.livvic(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Gap(20),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    error: (e, err) {
                      return Center(
                        child: Text('$e & $err'),
                      );
                    },
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
