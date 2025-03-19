import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'dark_mode_state.dart';

class DarkModeCubit extends Cubit<DarkModeState> {
  DarkModeCubit() : super(DarkModeFalse());

  void toggleDarkMode() async {
    try {
      if (state is DarkModeFalse) {
        emit(DarkModeTrue());
      } else {
        emit(DarkModeFalse());
      }
    } catch (e) {
      emit(DarkModeError(message: '$e'));
    }
  }
}
