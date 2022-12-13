import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petcentral_web_admin/core/common/color_values.dart';
import 'package:petcentral_web_admin/features/dashboard/presentation/desktop/widget/widget.dart';
import 'package:petcentral_web_admin/features/reservation/domain/repositories/reservation_repository.dart';
import 'package:petcentral_web_admin/features/reservation/presentation/logic/cubit/change_filter_cubit.dart';
import 'package:petcentral_web_admin/features/reservation/presentation/logic/cubit/reservation_hotel_cubit.dart';
import 'package:petcentral_web_admin/features/reservation/presentation/logic/cubit/update_res_hotel_cubit.dart';
import 'package:petcentral_web_admin/widget/widget.dart';
import 'package:sizer/sizer.dart';
import '../logic/reservation_hotel_state.dart';
import 'widget/widget.dart';

class ReservationHotelPage extends StatelessWidget {
  const ReservationHotelPage({
    Key? key,
  }) : super(key: key);

  Widget checkStatus(String status) {
    switch (status) {
      case "approved":
        return const ApprovedLabelWidget();
      case "Pending":
        return const PendingLabelWidget();
      default:
        return const PendingLabelWidget();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ReservationHotelCubit(
              RepositoryProvider.of<ReservationRepository>(context)),
        ),
        BlocProvider<ChangeFilterCubit>(
          create: (_) => ChangeFilterCubit(),
        ),
        BlocProvider<UpdateResHotelCubit>(
          create: (_) => UpdateResHotelCubit(
            RepositoryProvider.of<ReservationRepository>(context),
          ),
        ),
      ],
      child: BlocBuilder<ChangeFilterCubit, int>(
        builder: (changecontext, changeState) {
          return BlocBuilder<ReservationHotelCubit, ReservationHotelState>(
            builder: (context, state) {
              if (state is LoadingReservationHotelState) {
                return Padding(
                  padding: EdgeInsets.only(top: 30.h),
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: ColorValues.primaryBlue,
                    ),
                  ),
                );
              }
              if (state is InitialReservationHotelState) {
                context.read<ReservationHotelCubit>().getReservationHotel();
              }
              if (state is SuccesReservationHotelState) {
                return Column(
                  children: [
                    const TitleContentWidget(
                      mainTitle: 'Reservation',
                      parentPath: 'Home / Reservation',
                      childPath: ' / Grooming',
                    ),
                    ListReservationHotel(
                      summary: state.reservationHotelEntity.summary,
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    ContainerShadowWidget(
                      padding: EdgeInsets.all(
                        4.2.sp,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'List of Grooming Reservation',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 3.2.sp,
                            ),
                          ),
                          SizedBox(
                            height: 3.4.sp,
                          ),
                          ListFilterReservation(
                            filters: state.reservationHotelEntity.filters,
                            isGrooming: false,
                          ),
                          Row(
                            children: [
                              const Spacer(),
                              SizedBox(
                                width: 18.w,
                                child: TextField(
                                  style: GoogleFonts.poppins(
                                      fontSize: 2.4.sp,
                                      fontWeight: FontWeight.w400,
                                      color: ColorValues.fontBlack),
                                  decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.all(2.6.sp),
                                    hintText: 'Search',
                                    hintStyle: GoogleFonts.poppins(
                                      fontSize: 2.4.sp,
                                      fontWeight: FontWeight.w400,
                                      color: ColorValues.grey,
                                    ),
                                    suffixIcon: Padding(
                                      padding: EdgeInsets.only(right: 2.2.sp),
                                      child: SvgPicture.asset(
                                        'assets/icons/icon_search.svg',
                                        width: 4.sp,
                                        height: 4.sp,
                                      ),
                                    ),
                                    suffixIconConstraints:
                                        const BoxConstraints(),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          8,
                                        ),
                                        borderSide: const BorderSide(
                                            color: ColorValues.grey, width: 1)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          8,
                                        ),
                                        borderSide: const BorderSide(
                                            color: ColorValues.grey, width: 1)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 4.2.sp,
                          ),
                          Row(
                            children: [
                              Text(
                                'Showing 2 entries',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 2.8.sp,
                                    color: ColorValues.grey),
                              ),
                              const Spacer(),
                              Text(
                                'Filter :',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 2.8.sp,
                                  color: ColorValues.grey,
                                ),
                              ),
                              SizedBox(
                                width: 3.2.sp,
                              ),
                              Text(
                                'Recent services',
                                style: GoogleFonts.poppins(
                                    fontSize: 2.8.sp,
                                    fontWeight: FontWeight.w600,
                                    color: ColorValues.primaryBlue),
                              ),
                              SizedBox(
                                width: 2.2.sp,
                              ),
                              SvgPicture.asset(
                                'assets/icons/icon_arrow_down.svg',
                                width: 4.sp,
                                height: 4.sp,
                                color: ColorValues.primaryBlue,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 4.2.sp,
                          ),
                          state.reservationHotelEntity.listReservationHotel
                                  .isEmpty
                              ? Center(
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        'assets/images/empty_img.png',
                                        width: 42.sp,
                                        height: 42.sp,
                                        fit: BoxFit.contain,
                                      ),
                                      SizedBox(
                                        height: 4.2.sp,
                                      ),
                                      Text(
                                        'No Hotel Reservation Found!',
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 2.5.sp,
                                            color: ColorValues.fontBlack),
                                      ),
                                      Text(
                                        'You don’t have any Hotel Reservation yet.',
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 2.5.sp,
                                          color: ColorValues.grey,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 6.2.sp,
                                      ),
                                    ],
                                  ),
                                )
                              : Column(
                                  children: List.generate(
                                    state.reservationHotelEntity
                                        .listReservationHotel.length,
                                    (index) => Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 16.0),
                                      child: HoverCardWidget(
                                        padding: EdgeInsets.all(
                                          4.sp,
                                        ),
                                        child: Column(
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      state
                                                          .reservationHotelEntity
                                                          .listReservationHotel[
                                                              index]
                                                          .id
                                                          .toString(),
                                                      style:
                                                          GoogleFonts.poppins(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 2.6.sp,
                                                        color: ColorValues.grey,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                        vertical: 12,
                                                      ),
                                                      child: Text(
                                                        state
                                                            .reservationHotelEntity
                                                            .listReservationHotel[
                                                                index]
                                                            .serviceType["type"],
                                                        style:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 2.6.sp,
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      '${state.reservationHotelEntity.listReservationHotel[index].dateIn} - ${state.reservationHotelEntity.listReservationHotel[index].dateIn}',
                                                      style:
                                                          GoogleFonts.poppins(
                                                        fontSize: 2.6.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: ColorValues.grey,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 4.sp,
                                                    ),
                                                    Row(
                                                      children: [
                                                        state
                                                                .reservationHotelEntity
                                                                .listReservationHotel[
                                                                    index]
                                                                .customer[
                                                                    'picture']
                                                                .toString()
                                                                .isEmpty
                                                            ? Icon(
                                                                Icons
                                                                    .account_circle,
                                                                color:
                                                                    ColorValues
                                                                        .grey,
                                                                size: 7.sp,
                                                              )
                                                            : Image.network(
                                                                state
                                                                    .reservationHotelEntity
                                                                    .listReservationHotel[
                                                                        index]
                                                                    .customer['picture'],
                                                              ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 8.0),
                                                          child: Text(
                                                            state
                                                                .reservationHotelEntity
                                                                .listReservationHotel[
                                                                    index]
                                                                .customer['name'],
                                                            style: GoogleFonts
                                                                .poppins(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 2.6.sp,
                                                              color: ColorValues
                                                                  .primaryBlue,
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                const Spacer(),
                                                Row(
                                                  children: [
                                                    checkStatus(state
                                                        .reservationHotelEntity
                                                        .listReservationHotel[
                                                            index]
                                                        .status),
                                                    const SizedBox(
                                                      width: 32,
                                                    ),
                                                    if (state
                                                            .reservationHotelEntity
                                                            .listReservationHotel[
                                                                index]
                                                            .status ==
                                                        'pending')
                                                      IconButtonAcceptWidget(
                                                        onTap: () {
                                                          context
                                                              .read<
                                                                  UpdateResHotelCubit>()
                                                              .updateReservationHotel(
                                                                status:
                                                                    'approved',
                                                                reservationId: state
                                                                    .reservationHotelEntity
                                                                    .listReservationHotel[
                                                                        index]
                                                                    .id,
                                                              );
                                                          context
                                                              .read<
                                                                  ReservationHotelCubit>()
                                                              .getReservationHotel(
                                                                status: state
                                                                        .reservationHotelEntity
                                                                        .filters[
                                                                    changeState],
                                                              );
                                                        },
                                                      ),
                                                    SizedBox(
                                                      width: 1.6.sp,
                                                    ),
                                                    if (state
                                                            .reservationHotelEntity
                                                            .listReservationHotel[
                                                                index]
                                                            .status ==
                                                        'pending')
                                                      IconButtonRejectWidget(
                                                        onTap: () {},
                                                      ),
                                                    SizedBox(
                                                      width: 1.6.sp,
                                                    ),
                                                    IconButtonChatWidget(
                                                      onTap: () {},
                                                    )
                                                  ],
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                        ],
                      ),
                    )
                  ],
                );
              }
              return Padding(
                padding: EdgeInsets.only(top: 30.h),
                child: const Center(
                  child: CircularProgressIndicator(
                    color: ColorValues.primaryBlue,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
