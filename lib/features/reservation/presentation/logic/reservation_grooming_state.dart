import 'package:equatable/equatable.dart';
import 'package:petcentral_web_admin/features/reservation/domain/entity/reservation_grooming_entity.dart';

abstract class ReservationGroomingState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadingReservationGroomingState extends ReservationGroomingState {}

class InitialReservationGroomingState extends ReservationGroomingState {}

class SuccesReservationGroomingState extends ReservationGroomingState {
  final ReservationGroomingEntity reservationGroomingEntity;

  SuccesReservationGroomingState(this.reservationGroomingEntity);
}

class FailureReservationGroomingState extends ReservationGroomingState {
  final String msg;

  FailureReservationGroomingState(this.msg);
}
