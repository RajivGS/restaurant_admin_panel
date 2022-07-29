part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

class LoadCategories extends CategoryEvent {
  final List<CategoryModel> categories;
  const LoadCategories({this.categories = const <CategoryModel>[]});

  @override
  List<Object> get props => [categories];
}

class SelectCategories extends CategoryEvent {
  final CategoryModel categoryModel;
  const SelectCategories(this.categoryModel);

  @override
  List<Object> get props => [categoryModel];
}

class SortCategories extends CategoryEvent {
  final int oldIndex;
  final int newIndex;

  const SortCategories({
    required this.oldIndex,
    required this.newIndex,
  });
}
