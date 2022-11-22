import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:petcentral_web_admin/provider/provider_services.dart';
import 'package:sizer/sizer.dart';

class CustomerListScreen extends HookConsumerWidget {
  const CustomerListScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customerData = ref.watch(customerList);
    return Scaffold(
      body: customerData.when(
        data: (data) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
              ),
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 50,
                  width: double.infinity,
                  margin:
                      const EdgeInsets.only(bottom: 10, right: 10, left: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).canvasColor,
                    boxShadow: const [BoxShadow()],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          const Icon(
                            Icons.people,
                            color: Colors.white,
                          ),
                          const Gap(20),
                          Text(
                            '${data[index].name}',
                            style: GoogleFonts.livvic(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      const Gap(30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10)),
                            width: 4.w,
                            height: 30,
                            child: Center(
                              child: Text(
                                'Details',
                                style: GoogleFonts.livvic(
                                    fontSize: 10,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.yellow,
                                borderRadius: BorderRadius.circular(10)),
                            width: 4.w,
                            height: 30,
                            child: Center(
                              child: Text(
                                'Edit',
                                style: GoogleFonts.livvic(
                                    fontSize: 10,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10)),
                            width: 4.w,
                            height: 30,
                            child: Center(
                              child: Text(
                                'Delete',
                                style: GoogleFonts.livvic(
                                    fontSize: 10,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          );
        },
        error: (e, err) {
          return Center(
            child: Text('error getting data $e & $err'),
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
