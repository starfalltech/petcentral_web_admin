import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcentral_web_admin/core/error/failure.dart';
import 'package:petcentral_web_admin/features/reservation/presentation/logic/reservation_grooming_state.dart';

import '../../../domain/repositories/reservation_repository.dart';

class ReservationGroomingCubit extends Cubit<ReservationGroomingState> {
  ReservationRepository repository;

  ReservationGroomingCubit(this.repository)
      : super(InitialReservationGroomingState());

  void getReservationGroomign({String? status}) async {
    emit(LoadingReservationGroomingState());
    final result = await repository.getReservationGrooming(status: status);
    result.fold((l) {
      if (l is ServerFailure) {
        emit(FailureReservationGroomingState(l.msg));
      }
    }, (r) => emit(SuccesReservationGroomingState(r)));
  }


}
