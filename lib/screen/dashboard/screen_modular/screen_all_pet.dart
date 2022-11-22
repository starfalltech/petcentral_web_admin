import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:petcentral_web_admin/const/colors_const.dart';
import 'package:petcentral_web_admin/provider/provider_services.dart';
import 'package:sizer/sizer.dart';

class GetAllPet extends HookConsumerWidget {
  const GetAllPet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final petData = ref.watch(allPetProvider);
    return Scaffold(
        body: Column(
      children: [
        const Gap(20),
        Expanded(
            child: petData.when(
                data: (data) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                      ),
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        final dob =
                            DateFormat.yMMMEd().format(data[index].dob!);
                        return Container(
                          height: 50,
                          width: double.infinity,
                          margin: const EdgeInsets.only(
                              bottom: 10, right: 10, left: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Theme.of(context).canvasColor,
                            boxShadow: const [BoxShadow()],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    height: 120,
                                    child: Card(
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(15),
                                              topRight: Radius.circular(15))),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          const Icon(
                                            Icons.pets_outlined,
                                            color: Colors.black,
                                          ),
                                          const Gap(10),
                                          Text(
                                            '${data[index].name}',
                                            style: GoogleFonts.livvic(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 18,
                                            ),
                                          ),
                                          Text(
                                            '${data[index].age} y.o',
                                            style: GoogleFonts.livvic(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const Gap(10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        width: 90,
                                        height: 25,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: actionColor),
                                        child: Center(
                                          child: Text(
                                            data[index].type!.toUpperCase(),
                                            style: GoogleFonts.livvic(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 8,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 90,
                                        height: 25,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: actionColor),
                                        child: Center(
                                          child: Text(
                                            '${data[index].gender}',
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.livvic(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 8,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 90,
                                        height: 25,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: actionColor),
                                        child: Center(
                                          child: Text(
                                            '${data[index].breed!.name}',
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.livvic(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 8,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  const Gap(10),
                                  Container(
                                    width: 110,
                                    height: 25,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: accentCanvasColor),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          dob,
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.livvic(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 8,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: double.infinity,
                                height: 15.h,
                                child: Card(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(15),
                                          bottomRight: Radius.circular(15))),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.person,
                                              size: 15,
                                            ),
                                            const Gap(10),
                                            Text(
                                              '${data[index].owner!.name}',
                                              style: GoogleFonts.livvic(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w800,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Gap(10),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.phone_android_rounded,
                                              size: 15,
                                            ),
                                            const Gap(10),
                                            Text(
                                              '0${data[index].owner!.mobilePhone}',
                                              style: GoogleFonts.livvic(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Gap(10),
                                        SizedBox(
                                          width: double.infinity,
                                          child: Row(
                                            children: [
                                              const Icon(
                                                Icons.home,
                                                size: 15,
                                              ),
                                              const Gap(10),
                                              Text(
                                                '${data[index].owner!.homeAddress}',
                                                style: GoogleFonts.livvic(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                              // Row(
                              //   mainAxisAlignment:
                              //       MainAxisAlignment.spaceAround,
                              //   children: [
                              //     Container(
                              //       decoration: BoxDecoration(
                              //           color: Colors.blue,
                              //           borderRadius:
                              //               BorderRadius.circular(10)),
                              //       width: 4.w,
                              //       height: 30,
                              //       child: Center(
                              //         child: Text(
                              //           'Details',
                              //           style: GoogleFonts.livvic(
                              //               fontSize: 10,
                              //               color: Colors.white,
                              //               fontWeight: FontWeight.w600),
                              //         ),
                              //       ),
                              //     ),
                              //     Container(
                              //       decoration: BoxDecoration(
                              //           color: Colors.yellow,
                              //           borderRadius:
                              //               BorderRadius.circular(10)),
                              //       width: 4.w,
                              //       height: 30,
                              //       child: Center(
                              //         child: Text(
                              //           'Edit',
                              //           style: GoogleFonts.livvic(
                              //               fontSize: 10,
                              //               color: Colors.white,
                              //               fontWeight: FontWeight.w600),
                              //         ),
                              //       ),
                              //     ),
                              //     Container(
                              //       decoration: BoxDecoration(
                              //           color: Colors.red,
                              //           borderRadius:
                              //               BorderRadius.circular(10)),
                              //       width: 4.w,
                              //       height: 30,
                              //       child: Center(
                              //         child: Text(
                              //           'Delete',
                              //           style: GoogleFonts.livvic(
                              //               fontSize: 10,
                              //               color: Colors.white,
                              //               fontWeight: FontWeight.w600),
                              //         ),
                              //       ),
                              //     )
                              //   ],
                              // )
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
                error: (e, err) => const Center(
                      child: Text(' No Data'),
                    ),
                loading: () =>
                    const Center(child: CircularProgressIndicator())))
      ],
    ));
  }
}
