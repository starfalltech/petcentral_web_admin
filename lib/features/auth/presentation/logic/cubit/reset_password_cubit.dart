import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcentral_web_admin/features/auth/presentation/logic/reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(InitialResetPasswordState());

  void resetPassword() {
    emit(LoadingResetPasswordState());
    Future.delayed(const Duration(milliseconds: 3000)).then((value) {
      emit(SuccesResetPasswordState());
    });
  }
}
