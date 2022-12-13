import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcentral_web_admin/core/common/color_values.dart';
import 'package:petcentral_web_admin/features/dashboard/presentation/desktop/widget/appbar_dashboard_widget.dart';
import 'package:petcentral_web_admin/features/dashboard/presentation/logic/cubit/select_page_cubit.dart';
import 'package:petcentral_web_admin/features/reservation/data/datasources/reservation_grooming_remote_datasurce.dart';
import 'package:petcentral_web_admin/features/reservation/data/repositories/reservation_grooming_repository_impl.dart';
import 'package:petcentral_web_admin/features/reservation/domain/repositories/reservation_repository.dart';
import 'package:petcentral_web_admin/features/reservation/presentation/desktop/reservation_grooming_page.dart';
import 'package:petcentral_web_admin/features/reservation/presentation/desktop/reservation_hotel_page.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/platform/rest_client_service/rest_client_service.dart';
import 'widget/widget.dart';

class DashBoardPage extends StatelessWidget {
  const DashBoardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const pages = [
      DashBoardChild(),
      ReservationGroomingPage(),
      ReservationHotelPage(),
      Center(
        child: Text(
          'Cooming Soon',
          style: TextStyle(
              color: ColorValues.fontBlack,
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
      ),
      Center(
        child: Text(
          'Cooming Soon',
          style: TextStyle(
              color: ColorValues.fontBlack,
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
      ),
      Center(
        child: Text(
          'Cooming Soon',
          style: TextStyle(
              color: ColorValues.fontBlack,
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
      ),
      Center(
        child: Text(
          'Cooming Soon',
          style: TextStyle(
              color: ColorValues.fontBlack,
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
      ),
      Center(
        child: Text(
          'Cooming Soon',
          style: TextStyle(
              color: ColorValues.fontBlack,
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
      ),
      Center(
        child: Text(
          'Cooming Soon',
          style: TextStyle(
              color: ColorValues.fontBlack,
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
      ),
    ];
    return Scaffold(
      body: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<RestClientService>(
            create: (context) => RestClientService.create(),
          ),
          RepositoryProvider<ReservationGroomingRemoteDataSource>(
            create: (context) => ReservationGroomingRemoteDateSourceImpl(
              RepositoryProvider.of<RestClientService>(context),
            ),
          ),
          RepositoryProvider<ReservationRepository>(
            create: (context) => ReservationGroomingRepositoryImpl(
              RepositoryProvider.of<ReservationGroomingRemoteDataSource>(
                  context),
            ),
          )
        ],
        child: BlocProvider<SelectPageCubit>(
          create: (context) => SelectPageCubit(),
          child: BlocBuilder<SelectPageCubit, int>(
            builder: (context, state) {
              return SafeArea(
                child: Row(
                  children: [
                    const NavigationDrawerWidget(),
                    Expanded(
                      child: Scaffold(
                        appBar: const AppbarDashBoardWidget(),
                        body: SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: 7.sp,
                              left: 8.sp,
                              right: 9.w,
                            ),
                            child: pages[state],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
