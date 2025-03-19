import 'package:appdev_midterm/models/item.dart';
import 'package:appdev_midterm/providers/api_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_item_state.dart';

class GetItemCubit extends Cubit<GetItemState> {
  ItemProvider provider = ItemProvider();

  GetItemCubit({required ItemProvider itemProvider})
      : provider = itemProvider,
        super(GetItemInitial());

  void getItems() async {
    emit(GetItemLoading());
    try {
      await provider.getItems();
      List<Product> items = provider.itemList;
      emit(GetItemLoaded(item: items));
    } catch (e) {
      emit(GetItemError(message: '$e'));
    }
  }
}
