import 'package:flutter/material.dart';
import 'package:restaurant_admin_panel/config/responsive.dart';
import 'package:restaurant_admin_panel/model/category_model.dart';
import 'package:restaurant_admin_panel/model/product_model.dart';
import 'package:restaurant_admin_panel/widgets/product_list_tile.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/custom_list-tile.dart';
import '../widgets/product_card.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(),
        drawer: const CustomDrawer(),
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Restaurant Menu",
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                          width: double.infinity,
                          height: 200,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: ProductModel.products.length,
                            itemBuilder: (context, index) {
                              return ProductCard(
                                product: ProductModel.products[index],
                                index: index,
                              );
                            },
                          )),
                      const SizedBox(height: 20),
                      Responsive.isWideDesktop(context) ||
                              Responsive.isDesktop(context)
                          ? Container(
                              constraints: const BoxConstraints(
                                  minWidth: 300, maxHeight: 1000),
                              child: Row(children: [
                                Expanded(child: buildCategories(context)),
                                const SizedBox(width: 10),
                                Expanded(child: _buildProduct(context)),
                              ]),
                            )
                          : Column(children: [
                              buildCategories(context),
                              const SizedBox(height: 20),
                              _buildProduct(context),
                            ]),
                      const SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        constraints: const BoxConstraints(minHeight: 75),
                        color: Theme.of(context).colorScheme.primary,
                        child: const Center(
                          child: Text('Some ads here'),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Responsive.isWideDesktop(context) || Responsive.isDesktop(context)
                ? Expanded(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(0, 20, 20, 20),
                      color: Theme.of(context).colorScheme.background,
                      child: const Center(child: Text('Some ads here')),
                    ),
                  )
                : const SizedBox()
          ],
        ));
  }

  Container buildCategories(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      color: Theme.of(context).colorScheme.background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Categories', style: Theme.of(context).textTheme.headline4),
          const SizedBox(height: 20),
          ...CategoryModel.categories.map((category) {
            return CustomListTile(
              category: category,
            );
          }).toList(),
        ],
      ),
    );
  }

  Container _buildProduct(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      color: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          Text("Products", style: Theme.of(context).textTheme.headline4),
          const SizedBox(height: 20),
          ...ProductModel.products.map((product) {
            return ProductListTile(product: product);
          })
        ],
      ),
    );
  }
}
