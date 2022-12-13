import 'package:equatable/equatable.dart';
import 'package:petcentral_web_admin/features/reservation/domain/entity/reservation_grooming_entity.dart';

abstract class UpdateResHotelState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadingUpdateResHotelState extends UpdateResHotelState {}

class InitialUpdateResHotelState extends UpdateResHotelState {}

class SuccesUpdateResHotelState extends UpdateResHotelState {
}

class FailureUpdateResHotelState extends UpdateResHotelState {
  final String msg;

  FailureUpdateResHotelState(this.msg);
}
