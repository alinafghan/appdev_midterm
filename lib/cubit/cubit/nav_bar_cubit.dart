import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'nav_bar_state.dart';

class NavBarCubit extends Cubit<NavBarState> {
  NavBarCubit() : super(NavBarHome());

  void changePage(int page) {
    try {
      if (page == 2) {
        emit(NavBarCategories());
      } else if (page == 1) {
        emit(NavBarProfile());
      } else {
        emit(NavBarHome());
      }
    } catch (e) {
      emit(NavBarError(message: '$e'));
    }
  }
}
