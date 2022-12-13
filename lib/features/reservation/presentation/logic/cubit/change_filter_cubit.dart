import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeFilterCubit extends Cubit<int> {
  ChangeFilterCubit() : super(0);

  void changeFilter(int index) => emit(index);
}
