import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:petcentral_web_admin/provider/provider_services.dart';

class CustomerListScreen extends HookConsumerWidget {
  const CustomerListScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customerData = ref.watch(customerList);
    return Scaffold(
      body: customerData.when(
        data: (data) {
          return ListView.builder(
            itemCount: data.length,
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
                children: [
                  const Gap(20),
                  const Icon(
                    Icons.person,
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
                  )
                ],
              ),
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
