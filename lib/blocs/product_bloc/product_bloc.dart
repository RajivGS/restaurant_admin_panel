import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_admin_panel/blocs/blocs.dart';
import 'package:restaurant_admin_panel/model/category_model.dart';
import 'package:restaurant_admin_panel/model/product_model.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final CategoryBloc _categoryBloc;
  StreamSubscription? categorySubscription;
  ProductBloc({required CategoryBloc categoryBloc})
      : _categoryBloc = categoryBloc,
        super(ProductLoading()) {
    on<LoadProducts>(_onLoadProducts);

    on<UpdateProducts>(_onupdateProducts);
    on<SortProducts>(_onSortProducts);
  }

  void _onLoadProducts(LoadProducts event, Emitter<ProductState> emit) async {
    await Future.delayed(const Duration(seconds: 1));
    emit(ProductLoaded(products: event.products));
  }

  void _onupdateProducts(UpdateProducts event, Emitter<ProductState> emit) {}

  void _onSortProducts(SortProducts event, Emitter<ProductState> emit) async {
    final state = this.state as ProductLoaded;
    emit(ProductLoading());
    await Future<void>.delayed(const Duration(seconds: 1));

    int newIndex =
        (event.newIndex > event.oldIndex) ? event.newIndex - 1 : event.newIndex;
    try {
      ProductModel selectProduct = state.products[event.oldIndex];
      List<ProductModel> product = List.from(state.products)
        ..remove(selectProduct)
        ..insert(newIndex, selectProduct);
      emit(ProductLoaded(products: product));
    } catch (_) {}
  }
}
