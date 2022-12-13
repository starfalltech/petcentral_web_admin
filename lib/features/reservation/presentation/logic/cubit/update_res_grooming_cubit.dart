import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcentral_web_admin/features/reservation/presentation/logic/update_res_grooming_state.dart';

import '../../../../../core/error/failure.dart';
import '../../../domain/repositories/reservation_repository.dart';

class UpdateResGroomingCubit extends Cubit<UpdateResGroomingState>{
  ReservationRepository repository;

  UpdateResGroomingCubit(this.repository):super(InitialUpdateResGroomingState());

  void updateReservationGroomign({
    required String status,
    required int reservationId,
  }) async {
    emit(LoadingUpdateResGroomingState());
    final result = await repository.updateReservationGrooming(
        status: status, reservationId: reservationId);
    result.fold((l) {
      if (l is ServerFailure) {
        emit(FailureUpdateResGroomingState(l.msg));
      }
    }, (r) => emit(SuccesUpdateResGroomingState()));
  }
}