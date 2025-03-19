part of 'get_item_cubit.dart';

abstract class GetItemState extends Equatable {
  const GetItemState();
}

final class GetItemInitial extends GetItemState {
  @override
  List<Object> get props => [];
}

final class GetItemLoading extends GetItemState {
  @override
  List<Object> get props => [];
}

final class GetItemLoaded extends GetItemState {
  final List<Product> item;

  const GetItemLoaded({required this.item});

  @override
  List<Object> get props => [item];
}

final class GetItemError extends GetItemState {
  final String message;

  const GetItemError({required this.message});

  @override
  List<Object> get props => [message];
}
