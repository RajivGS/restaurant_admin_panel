// ignore_for_file: unused_field

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
  StreamSubscription? _categorySubscription;
  ProductBloc({required CategoryBloc categoryBloc})
      : _categoryBloc = categoryBloc,
        super(ProductLoading()) {
    on<LoadProducts>(_onLoadProducts);
    on<UpdateProducts>(_onupdateProducts);
    on<SortProducts>(_onSortProducts);
    on<AddProducts>(_onAddProducts);

    _categorySubscription = _categoryBloc.stream.listen((state) {
      if (state is CategoryLoaded && state.selectedCategory != null) {
        add(UpdateProducts(categoryModel: state.selectedCategory!));
      }
    });
  }

  void _onLoadProducts(LoadProducts event, Emitter<ProductState> emit) async {
    await Future.delayed(const Duration(seconds: 1));
    emit(ProductLoaded(products: event.productsModel));
  }

  void _onupdateProducts(
      UpdateProducts event, Emitter<ProductState> emit) async {
    emit(ProductLoading());
    await Future<void>.delayed(const Duration(seconds: 1));
    List<ProductModel> filterProducts = ProductModel.products
        .where((product) => product.category == event.categoryModel.name)
        .toList();
    emit(ProductLoaded(products: filterProducts));
  }

  void _onSortProducts(SortProducts event, Emitter<ProductState> emit) async {
    final state = this.state as ProductLoaded;
    emit(ProductLoading());
    await Future<void>.delayed(const Duration(seconds: 1));

    int newIndex =
        (event.newIndex > event.oldIndex) ? event.newIndex - 1 : event.newIndex;
    try {
      ProductModel selectProduct = state.products[event.oldIndex];
      List<ProductModel> sortedProduct = List.from(state.products)
        ..remove(selectProduct)
        ..insert(newIndex, selectProduct);
      emit(ProductLoaded(products: sortedProduct));
    } catch (_) {}
  }

  void _onAddProducts(AddProducts event, Emitter<ProductState> emit) async {
    if (state is ProductLoaded) {
      print('Adding Product');
      emit(ProductLoaded(
          products: List.from((state as ProductLoaded).products)
            ..add(event.productsModel)));
    }
  }
}
