import 'package:equatable/equatable.dart';
import 'package:petcentral_web_admin/features/reservation/domain/entity/reservation_grooming_entity.dart';
import 'package:petcentral_web_admin/features/reservation/domain/entity/reservation_hotel_entity.dart';

abstract class ReservationHotelState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadingReservationHotelState extends ReservationHotelState {}

class InitialReservationHotelState extends ReservationHotelState {}

class SuccesReservationHotelState extends ReservationHotelState {
  final ReservationHotelEntity reservationHotelEntity;

  SuccesReservationHotelState(this.reservationHotelEntity);
}

class FailureReservationHotelState extends ReservationHotelState {
  final String msg;

  FailureReservationHotelState(this.msg);
}
