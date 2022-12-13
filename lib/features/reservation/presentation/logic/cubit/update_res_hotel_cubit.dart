import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failure.dart';
import '../../../domain/repositories/reservation_repository.dart';
import '../update_res_hotel_state.dart';

class UpdateResHotelCubit extends Cubit<UpdateResHotelState> {
  ReservationRepository repository;

  UpdateResHotelCubit(this.repository) : super(InitialUpdateResHotelState());

  void updateReservationHotel({
    required String status,
    required int reservationId,
  }) async {
    emit(LoadingUpdateResHotelState());
    final result = await repository.updateReservationHotel(
        status: status, reservationId: reservationId);
    result.fold((l) {
      if (l is ServerFailure) {
        emit(FailureUpdateResHotelState(l.msg));
      }
    }, (r) => emit(SuccesUpdateResHotelState()));
  }
}
