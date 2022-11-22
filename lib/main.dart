import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:petcentral_web_admin/api_services/secure_storage.dart';
import 'package:petcentral_web_admin/const/colors_const.dart';
import 'package:petcentral_web_admin/primary_button.dart';
import 'package:petcentral_web_admin/screen/dashboard/dashboard_screen.dart';
import 'package:petcentral_web_admin/screen/dashboard/screen_one.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:http/http.dart' as http;
import 'package:sizer/sizer.dart';

void main() {
  runApp(Sizer(
    builder: ((context, orientation, deviceType) {
      return const ProviderScope(child: MyApp());
    }),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pet Central',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        canvasColor: canvasColor,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            color: Colors.white,
            fontSize: 46,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();

  final TextEditingController usr = TextEditingController();
  final TextEditingController pss = TextEditingController();

  Future<void> postLogin(String usr, pss) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST', Uri.parse('https://api.petcentral.id/auth/admin/signin'));
    request.body = json.encode({"email": usr, "password": pss});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      await response.stream.bytesToString().then((value) async {
        final Map map = jsonDecode(value);
        await SecureStorage().writeSecureData('userId', map['userId']);
        Get.offAll(() => DashBoardScreenX(
              keys: _key,
              controller: _controller,
            ));
      });
    } else {
      debugPrint(response.reasonPhrase);
      Get.snackbar(
        'Error',
        'No User Found',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: 100.w,
        height: 100.h,
        child: Center(
          child: SizedBox(
              width: 30.w,
              height: 45.h,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Text(
                            'This is Login',
                            style: GoogleFonts.livvic(
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff363636),
                              fontSize: 24,
                            ),
                          ),
                          const Gap(10),
                          SizedBox(
                            width: 20.w,
                            child: Text(
                              'This is login forms, please access it using your username and password you already provided and also, Riverpod Better LMAO ',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.livvic(
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff363636),
                                fontSize: 10,
                              ),
                            ),
                          )
                        ],
                      ),
                      const Gap(20),
                      SizedBox(
                        width: 30.w,
                        child: TextFormField(
                          controller: usr,
                          decoration: InputDecoration(
                            labelText: "Enter Email",
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: Colors.grey.shade100,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                                width: 2.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Gap(20),
                      SizedBox(
                        width: 30.w,
                        child: TextFormField(
                          controller: pss,
                          decoration: InputDecoration(
                            labelText: "Enter Password",
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: Colors.grey.shade100,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                                width: 2.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Gap(20),
                      PrimaryButton(
                        onPress: () async {
                          await postLogin(usr.text, pss.text);
                        },
                        txtButton: 'Login',
                      )
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}

class DashBoardScreenX extends StatelessWidget {
  const DashBoardScreenX({
    Key? key,
    required GlobalKey<ScaffoldState> keys,
    required SidebarXController controller,
  })  : _key = keys,
        _controller = controller,
        super(key: key);

  final GlobalKey<ScaffoldState> _key;
  final SidebarXController _controller;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final isSmallScreen = Get.width < 600;
        return Scaffold(
          key: _key,
          appBar: isSmallScreen
              ? AppBar(
                  backgroundColor: canvasColor,
                  // title: Text(_getTitleByIndex(_controller.selectedIndex)),
                  leading: IconButton(
                    onPressed: () {
                      _key.currentState?.openDrawer();
                    },
                    icon: const Icon(Icons.menu),
                  ),
                )
              : null,
          drawer: DrawerSidebarX(controller: _controller),
          body: Row(
            children: [
              if (!isSmallScreen) DrawerSidebarX(controller: _controller),
              Expanded(
                child: Center(
                  child: ScreenOne(
                    controller: _controller,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
