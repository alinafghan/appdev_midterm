part of 'nav_bar_cubit.dart';

abstract class NavBarState extends Equatable {
  const NavBarState();
}

final class NavBarHome extends NavBarState {
  const NavBarHome();
  @override
  List<Object> get props => [];
}

final class NavBarCategories extends NavBarState {
  const NavBarCategories();
  @override
  List<Object> get props => [];
}

final class NavBarProfile extends NavBarState {
  const NavBarProfile();
  @override
  List<Object> get props => [];
}

final class NavBarError extends NavBarState {
  final String message;

  const NavBarError({required this.message});
  @override
  List<Object> get props => [message];
}
