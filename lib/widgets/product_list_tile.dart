import 'package:flutter/material.dart';
import 'package:restaurant_admin_panel/model/product_model.dart';

class ProductListTile extends StatelessWidget {
  final ProductModel product;
  const ProductListTile({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(backgroundImage: NetworkImage(product.imageUrl)),
      title: Text(
        product.name,
        style: Theme.of(context).textTheme.headline5,
      ),
      subtitle: Text(
        product.description,
        style: Theme.of(context).textTheme.headline6,
      ),
      trailing: const Icon(Icons.menu),
    );
  }
}
