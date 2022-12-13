import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcentral_web_admin/core/error/failure.dart';
import 'package:petcentral_web_admin/features/auth/presentation/logic/login_state.dart';

import '../../../domain/repositories/auth_repository.dart';

class LoginCubit extends Cubit<LoginState> {
  AuthRepository repository;

  LoginCubit(this.repository) : super(InitialLoginState());

  void login({required String email, required String password}) async {
    emit(LoadingLoginState());
    final result = await repository.login(email, password);
    result.fold((l) {
      if (l is ServerFailure) {
        emit(FailureLoginState(l.msg));
      }
    }, (r) => emit(SuccesLoginState()));
  }
}
