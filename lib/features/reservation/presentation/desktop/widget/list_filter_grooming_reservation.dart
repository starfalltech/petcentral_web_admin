import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petcentral_web_admin/features/reservation/presentation/logic/cubit/change_filter_cubit.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/common/color_values.dart';
import '../../logic/cubit/reservation_grooming_cubit.dart';
import '../../logic/cubit/reservation_hotel_cubit.dart';

class ListFilterReservation extends StatefulWidget {
  final List<String> filters;
  final bool isGrooming;

  const ListFilterReservation({
    Key? key,
    required this.filters,
    required this.isGrooming,
  }) : super(key: key);

  @override
  State<ListFilterReservation> createState() => _ListFilterReservationState();
}

class _ListFilterReservationState extends State<ListFilterReservation> {
  @override
  Widget build(BuildContext context) {
    final selectIndex = BlocProvider.of<ChangeFilterCubit>(context);
    return Row(
      children: [
        Row(
          children: List.generate(
            widget.filters.length,
            (index) => InkWell(
              onTap: () {
                selectIndex.changeFilter(index);
                widget.isGrooming
                    ? BlocProvider.of<ReservationGroomingCubit>(context).getReservationGroomign(
                        status: widget.filters[index] == "All"
                            ? ""
                            : widget.filters[index],
                      )
                    : BlocProvider.of<ReservationHotelCubit>(context).getReservationHotel(
                        status: widget.filters[index] == "All"
                            ? ""
                            : widget.filters[index],
                      );
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 1.sp,
                  horizontal: 2.sp,
                ),
                decoration: BoxDecoration(
                  color: selectIndex.state == index
                      ? ColorValues.primaryBlue
                      : Colors.white,
                  borderRadius: BorderRadius.circular(
                    50,
                  ),
                ),
                child: Text(
                  widget.filters[index],
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 3.sp,
                      color: selectIndex.state == index
                          ? Colors.white
                          : ColorValues.grey),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
