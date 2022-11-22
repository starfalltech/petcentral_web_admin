import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
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
    final isNeed = useState<bool>(true);
    final isCheckIn = useState<bool>(false);
    final isCheckOut = useState<bool>(false);
    final reserveDataPending = ref.watch(reservationListPending);
    final reserveDataApproved = ref.watch(reservationListApproved);
    final reserveDataRejected = ref.watch(reservationListRejected);
    final checkInList = ref.watch(reservationCheckInList);
    final checkOutList = ref.watch(reservationCheckOutList);

    Future<void> acceptRes(int id) async {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request(
          'PUT',
          Uri.parse(
              'https://api.petcentral.id/admin/reservation/hotel/update-status'));
      request.body = json.encode({"branchId": id, "status": "approved"});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        debugPrint(await response.stream.bytesToString());
        Get.offAll(DashBoardScreenX(keys: _key, controller: _controller));
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

    Future<void> checkInAction(int id, epoch) async {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request(
          'POST',
          Uri.parse(
              'https://api.petcentral.id/admin/reservation/hotel/set-checkin'));
      request.body = json.encode({"reservationId": id, "epochTime": epoch});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      var data = await response.stream.bytesToString();
      if (response.statusCode == 200) {
        debugPrint(data);
        Get.offAll(DashBoardScreenX(keys: _key, controller: _controller));
        Get.snackbar(
          'Success',
          'Update Check In Success',
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

    Future<void> checkOutAction(int id, epoch) async {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request(
          'POST',
          Uri.parse(
              'https://api.petcentral.id/admin/reservation/hotel/set-checkout'));
      request.body = json.encode({"reservationId": id, "epochTime": epoch});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      var data = await response.stream.bytesToString();
      if (response.statusCode == 200) {
        debugPrint(data);
        Get.offAll(DashBoardScreenX(keys: _key, controller: _controller));
        Get.snackbar(
          'Success',
          'Update Check In Success',
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

    Future<void> updatePaymentDP(int id) async {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request(
          'PUT',
          Uri.parse(
              'https://api.petcentral.id/admin/reservation/hotel/update-payment-status'));
      request.body =
          json.encode({"reservationId": id, "paymentStatus": "dppaid"});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        debugPrint(await response.stream.bytesToString());
        Get.offAll(DashBoardScreenX(keys: _key, controller: _controller));
        Get.snackbar(
          'Success',
          'Update Payment Success',
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

    Future<void> updatePaymentFinish(int id) async {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request(
          'PUT',
          Uri.parse(
              'https://api.petcentral.id/admin/reservation/hotel/update-payment-status'));
      request.body =
          json.encode({"reservationId": id, "paymentStatus": "completed"});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        debugPrint(await response.stream.bytesToString());
        Get.offAll(DashBoardScreenX(keys: _key, controller: _controller));
        Get.snackbar(
          'Success',
          'Update Payment Success',
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
          (isApproved.value == true)
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        isNeed.value = false;
                        isCheckIn.value = true;
                        isCheckOut.value = false;
                      },
                      child: Container(
                          width: 130,
                          height: 30,
                          decoration: BoxDecoration(
                              color: actionColor,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Text(
                              'Check In',
                              style: GoogleFonts.livvic(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                          )),
                    ),
                    const Gap(20),
                    InkWell(
                      onTap: () {
                        isNeed.value = true;
                        isCheckIn.value = false;
                        isCheckOut.value = false;
                      },
                      child: Container(
                          width: 130,
                          height: 30,
                          decoration: BoxDecoration(
                              color: actionColor,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Text(
                              'Pending',
                              style: GoogleFonts.livvic(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                          )),
                    ),
                    const Gap(20),
                    InkWell(
                      onTap: () {
                        isNeed.value = false;
                        isCheckIn.value = false;
                        isCheckOut.value = true;
                      },
                      child: Container(
                          width: 130,
                          height: 30,
                          decoration: BoxDecoration(
                              color: actionColor,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Text(
                              'Check Out',
                              style: GoogleFonts.livvic(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                          )),
                    )
                  ],
                )
              : Container(),
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
                                    'Payment : ${data[index].paymentStatus}',
                                    style: GoogleFonts.livvic(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Dialogs.bottomMaterialDialog(
                                      msg: 'Please Choose The Payment',
                                      title: 'Payment Update',
                                      context: context,
                                      actions: [
                                        IconsOutlineButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          text: 'Cancel',
                                          iconData: Icons.cancel_outlined,
                                          textStyle: const TextStyle(
                                              color: Colors.grey),
                                          iconColor: Colors.grey,
                                        ),
                                        IconsButton(
                                          onPressed: () {
                                            updatePaymentDP(data[index].id!);
                                          },
                                          text: 'Payment 20% (DP)',
                                          iconData:
                                              Icons.monetization_on_rounded,
                                          color: Colors.red,
                                          textStyle: const TextStyle(
                                              color: Colors.white),
                                          iconColor: Colors.white,
                                        ),
                                      ]);
                                },
                                child: Container(
                                  width: 10.w,
                                  height: 5.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.blue,
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Update \nPayment',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.livvic(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
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
          (isApproved.value == true &&
                  isCheckIn.value == true &&
                  isCheckOut.value == false &&
                  isNeed.value == false)
              ? Expanded(
                  child: checkInList.when(
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
                                  InkWell(
                                    onTap: () {
                                      checkOutAction(
                                          data[index].id!,
                                          DateTime.now()
                                              .millisecondsSinceEpoch);
                                    },
                                    child: Container(
                                      width: 7.w,
                                      height: 5.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.red,
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Check-Out',
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
          (isApproved.value == true &&
                  isCheckOut.value == false &&
                  isCheckIn.value == false &&
                  isNeed.value == true)
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
                                  InkWell(
                                    onTap: () {
                                      checkInAction(
                                          data[index].id!,
                                          DateTime.now()
                                              .millisecondsSinceEpoch);
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
                                          'Check-In',
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
          (isApproved.value == true &&
                  isCheckIn.value == false &&
                  isCheckOut.value == true &&
                  isNeed.value == false)
              ? Expanded(
                  child: checkOutList.when(
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
                              InkWell(
                                onTap: () {
                                  Dialogs.bottomMaterialDialog(
                                      msg: 'Please Choose The Payment',
                                      title: 'Payment Update',
                                      context: context,
                                      actions: [
                                        IconsOutlineButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          text: 'Cancel',
                                          iconData: Icons.cancel_outlined,
                                          textStyle: const TextStyle(
                                              color: Colors.grey),
                                          iconColor: Colors.grey,
                                        ),
                                        IconsButton(
                                          onPressed: () {
                                            updatePaymentFinish(
                                                data[index].id!);
                                          },
                                          text: 'Payment 100% (completed)',
                                          iconData:
                                              Icons.monetization_on_rounded,
                                          color: Colors.green,
                                          textStyle: const TextStyle(
                                              color: Colors.white),
                                          iconColor: Colors.white,
                                        ),
                                      ]);
                                },
                                child: Container(
                                  width: 10.w,
                                  height: 5.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.blue,
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Update \nPayment',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.livvic(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
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
