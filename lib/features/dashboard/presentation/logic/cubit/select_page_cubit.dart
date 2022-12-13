import 'package:flutter_bloc/flutter_bloc.dart';

class SelectPageCubit extends Cubit<int> {
  SelectPageCubit() : super(0);

  void changePage(int index) => emit(index);
}
