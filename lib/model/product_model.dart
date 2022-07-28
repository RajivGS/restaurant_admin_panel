import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final String id;
  final String name;
  final String category;
  final String description;
  final String imageUrl;
  final double price;
  final int index;

  const ProductModel({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.index,
  });

  ProductModel copyWith({
    String? id,
    String? name,
    String? category,
    String? description,
    String? imageUrl,
    double? price,
    int? index,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
      index: index ?? this.index,
    );
  }

  factory ProductModel.fromSnapShot(Map<String, dynamic> snap) {
    return ProductModel(
        id: snap['id'],
        name: snap['name'],
        category: snap['category'],
        description: snap['description'],
        imageUrl: snap['imageUrl'],
        price: snap['price'],
        index: snap['index']);
  }

  @override
  List<Object> get props {
    return [
      id,
      name,
      category,
      description,
      imageUrl,
      price,
      index,
    ];
  }

  static List<ProductModel> products = const [
    ProductModel(
      id: '1',
      //restaurantId: 'MbyvrvKY1hdNohNU11EL',
      name: 'Margherita',
      category: 'Pizza',
      description: 'Tomatoes, mozzarella, basil',
      price: 4.99,
      imageUrl:
          'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
      index: 0,
    ),
    ProductModel(
      id: '2',
      //restaurantId: 'MbyvrvKY1hdNohNU11EL',
      name: '4 Formaggi',
      category: 'Pizza',
      description: 'Tomatoes, mozzarella, basil',
      price: 4.99,
      imageUrl:
          'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
      index: 1,
    ),
    ProductModel(
      id: '3',
      //restaurantId: 'MbyvrvKY1hdNohNU11EL',
      name: 'Baviera',
      category: 'Pizza',
      description: 'Tomatoes, mozzarella, basil',
      price: 4.99,
      imageUrl:
          'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
      index: 2,
    ),
    ProductModel(
      index: 3,
      id: '4',
      //restaurantId: 'MbyvrvKY1hdNohNU11EL',
      name: 'Baviera',
      category: 'Pizza',
      description: 'Tomatoes, mozzarella, basil',
      price: 4.99,
      imageUrl:
          'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
    ),
    ProductModel(
      index: 4,
      id: '5',
      //restaurantId: 'MbyvrvKY1hdNohNU11EL',
      name: 'Coca Cola',
      category: 'Drinks',
      description: 'A fresh drink',
      price: 1.99,
      imageUrl:
          'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
    ),
    ProductModel(
      index: 5,
      id: '6',
      //restaurantId: 'MbyvrvKY1hdNohNU11EL',
      name: 'Coca Cola',
      category: 'Drinks',
      description: 'A fresh drink',
      price: 1.99,
      imageUrl:
          'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
    ),
    ProductModel(
      index: 6,
      id: '7',
      //restaurantId: 'MbyvrvKY1hdNohNU11EL',
      name: 'Coca Cola',
      category: 'Drinks',
      description: 'A fresh drink',
      price: 1.99,
      imageUrl:
          'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
    ),
    ProductModel(
      index: 7,
      id: '8',
      //restaurantId: 'MbyvrvKY1hdNohNU11EL',
      name: 'Water',
      category: 'Drinks',
      description: 'A fresh drink',
      price: 1.99,
      imageUrl:
          'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
    ),
    ProductModel(
      index: 8,
      id: '9',
      //restaurantId: 'MbyvrvKY1hdNohNU11EL',
      name: 'Caesar Salad',
      category: 'Salads',
      description: 'A fresh drink',
      price: 1.99,
      imageUrl:
          'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
    ),
    ProductModel(
      index: 9,
      id: '10',
      //restaurantId: 'MbyvrvKY1hdNohNU11EL',
      name: 'CheeseBurger',
      category: 'Burgers',
      description: 'A burger with Cheese',
      price: 9.99,
      imageUrl:
          'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
    ),
    ProductModel(
      index: 10,
      id: '11',
      //restaurantId: 'MbyvrvKY1hdNohNU11EL',
      name: 'Chocolate Cake',
      category: 'Desserts',
      description: 'A cake with chocolate',
      price: 9.99,
      imageUrl:
          'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
    )
  ];
}
