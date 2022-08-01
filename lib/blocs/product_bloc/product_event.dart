part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class LoadProducts extends ProductEvent {
  final List<ProductModel> productsModel;
  const LoadProducts({
    this.productsModel = const <ProductModel>[],
  });

  @override
  List<Object> get props => [productsModel];
}

class UpdateProducts extends ProductEvent {
  final CategoryModel categoryModel;
  const UpdateProducts({
    required this.categoryModel,
  });

  @override
  List<Object> get props => [categoryModel];
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
