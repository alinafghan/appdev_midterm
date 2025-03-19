part of 'dark_mode_cubit.dart';

abstract class DarkModeState extends Equatable {
  const DarkModeState();
}

final class DarkModeInitial extends DarkModeState {
  @override
  List<Object> get props => [];
}

final class DarkModeLoading extends DarkModeState {
  @override
  List<Object> get props => [];
}

final class DarkModeTrue extends DarkModeState {
  final bool flipped = false;

  const DarkModeTrue({flipped = true});
  @override
  List<Object> get props => [flipped];
}

final class DarkModeFalse extends DarkModeState {
  final bool flipped = true;

  const DarkModeFalse({flipped = false});

  @override
  List<Object> get props => [flipped];
}

final class DarkModeError extends DarkModeState {
  final String message;

  const DarkModeError({required this.message});

  @override
  List<Object> get props => [message];
}
