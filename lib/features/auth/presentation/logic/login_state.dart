import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class InitialLoginState extends LoginState {}

class LoadingLoginState extends LoginState {}

class SuccesLoginState extends LoginState {}

class FailureLoginState extends LoginState {
  final String msg;

  FailureLoginState(this.msg);
}
