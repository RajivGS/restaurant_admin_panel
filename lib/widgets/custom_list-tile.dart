import 'package:flutter/material.dart';
import 'package:restaurant_admin_panel/model/category_model.dart';

class CustomListTile extends StatelessWidget {
  final CategoryModel category;
  const CustomListTile({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(category.imageUrl, height: 25),
      title: Text(
        category.name,
        style: Theme.of(context).textTheme.headline5,
      ),
      subtitle: Text(
        category.description,
        style: Theme.of(context).textTheme.headline6,
      ),
      trailing: const Icon(Icons.menu),
    );
  }
}
