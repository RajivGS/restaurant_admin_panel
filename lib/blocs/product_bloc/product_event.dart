part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class LoadProducts extends ProductEvent {
  final List<ProductModel> products;
  const LoadProducts({
    this.products = const <ProductModel>[],
  });

  @override
  List<Object> get props => [products];
}

class UpdateProducts extends ProductEvent {
  final List<CategoryModel> category;
  const UpdateProducts({
    this.category = const <CategoryModel>[],
  });

  @override
  List<Object> get props => [category];
}

class SortProducts extends ProductEvent {
  final int oldIndex;
  final int newIndex;
  const SortProducts({
    required this.oldIndex,
    required this.newIndex,
  });

  @override
  List<Object> get props => [oldIndex, newIndex];
}
