import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcentral_web_admin/core/error/failure.dart';
import 'package:petcentral_web_admin/features/reservation/presentation/logic/reservation_grooming_state.dart';
import 'package:petcentral_web_admin/features/reservation/presentation/logic/reservation_hotel_state.dart';

import '../../../domain/repositories/reservation_repository.dart';

class ReservationHotelCubit extends Cubit<ReservationHotelState> {
  ReservationRepository repository;

  ReservationHotelCubit(this.repository)
      : super(InitialReservationHotelState());

  void getReservationHotel({String? status}) async {
    emit(LoadingReservationHotelState());
    final result = await repository.getReservationHotel(status: status);
    result.fold((l) {
      if (l is ServerFailure) {
        emit(FailureReservationHotelState(l.msg));
      }
    }, (r) => emit(SuccesReservationHotelState(r)));
  }


}
