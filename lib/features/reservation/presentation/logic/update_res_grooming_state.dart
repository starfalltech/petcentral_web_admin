import 'package:equatable/equatable.dart';
import 'package:petcentral_web_admin/features/reservation/domain/entity/reservation_grooming_entity.dart';

abstract class UpdateResGroomingState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadingUpdateResGroomingState extends UpdateResGroomingState {}

class InitialUpdateResGroomingState extends UpdateResGroomingState {}

class SuccesUpdateResGroomingState extends UpdateResGroomingState {
}

class FailureUpdateResGroomingState extends UpdateResGroomingState {
  final String msg;

  FailureUpdateResGroomingState(this.msg);
}
