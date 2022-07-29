import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/category_model.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryLoading()) {
    on<LoadCategories>(_onLoadCategories);
    on<SortCategories>(_onSortCategories);
    on<SelectCategories>(_onSelectCategories);
  }

  void _onLoadCategories(
      LoadCategories event, Emitter<CategoryState> emit) async {
    await Future<void>.delayed(const Duration(seconds: 1));
    emit(CategoryLoaded(categories: event.categories));
  }

  void _onSortCategories(SortCategories event, Emitter<CategoryState> emit) {
    final state = this.state as CategoryLoaded;
  }

  void _onSelectCategories(
      SelectCategories event, Emitter<CategoryState> emit) {}
}
