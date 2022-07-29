import 'package:flutter/material.dart';
import 'package:restaurant_admin_panel/model/category_model.dart';

class CategoryListTile extends StatelessWidget {
  final Function()? onTap;
  final CategoryModel category;
  const CategoryListTile({
    Key? key,
    required this.category,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Image.asset(
        category.imageUrl,
        // height: 25
      ),
      title: Text(
        category.name,
        style: Theme.of(context).textTheme.headline5,
      ),
      subtitle: Text(
        category.description,
        style: Theme.of(context).textTheme.headline6,
      ),
      // trailing: const Icon(Icons.menu),
    );
  }
}
