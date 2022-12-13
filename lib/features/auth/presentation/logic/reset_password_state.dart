import 'package:equatable/equatable.dart';

abstract class ResetPasswordState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SuccesResetPasswordState extends ResetPasswordState {}

class InitialResetPasswordState extends ResetPasswordState {}

class LoadingResetPasswordState extends ResetPasswordState {}

class FailureResetPasswordState extends ResetPasswordState {
  final String msg;

  FailureResetPasswordState(this.msg);
}
