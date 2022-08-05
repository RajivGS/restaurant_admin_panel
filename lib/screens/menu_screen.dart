import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_admin_panel/blocs/product_bloc/product_bloc.dart';
import 'package:restaurant_admin_panel/config/responsive.dart';
import 'package:restaurant_admin_panel/model/product_model.dart';
import 'package:restaurant_admin_panel/widgets/custom_layout.dart';
import 'package:restaurant_admin_panel/widgets/product_list_tile.dart';

import '../blocs/category_bloc/category_bloc.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/custom_list_tile.dart';
import '../widgets/product_card.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const CustomDrawer(),
      body: CustomLayout(
        title: 'Restaurant Menu',
        widgets: [
          const SizedBox(height: 20),
          _buildProductCarousel(),
          const SizedBox(height: 20),
          Responsive.isWideDesktop(context) || Responsive.isDesktop(context)
              ? Container(
                  constraints:
                      const BoxConstraints(minWidth: 300, maxHeight: 1000),
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
        ],
      ),
    );
  }

  BlocBuilder<ProductBloc, ProductState> _buildProductCarousel() {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is ProductLoaded) {
          return SizedBox(
              width: double.infinity,
              height: 200,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: ProductModel.products.length,
                itemBuilder: (context, index) {
                  return ProductCard(
                    product: state.products[index],
                    index: index,
                  );
                },
              ));
        } else {
          return const Text('Something went wrong!');
        }
      },
    );
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
            BlocBuilder<CategoryBloc, CategoryState>(builder: (context, state) {
              if (state is CategoryLoading) {
                return Center(
                    child: CircularProgressIndicator(
                        color: Theme.of(context).colorScheme.primary));
              } else if (state is CategoryLoaded) {
                return ReorderableListView(
                    shrinkWrap: true,
                    children: [
                      for (int index = 0;
                          index < state.categories.length;
                          index++)
                        CategoryListTile(
                          category: state.categories[index],
                          onTap: (() {
                            context
                                .read<CategoryBloc>()
                                .add(SelectCategory(state.categories[index]));
                          }),
                          key: ValueKey(state.categories[index].id),
                        ),
                    ],
                    onReorder: ((oldIndex, newIndex) {
                      context.read<CategoryBloc>().add(SortCategories(
                          oldIndex: oldIndex, newIndex: newIndex));
                    }));
              } else {
                return const Text("Error");
              }
            }),
          ],
        ));
  }
}

Container _buildProduct(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(20.0),
    color: Theme.of(context).colorScheme.background,
    child: Column(
      children: [
        Text("Products", style: Theme.of(context).textTheme.headline4),
        const SizedBox(height: 20),
        BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
          if (state is ProductLoading) {
            return Center(
                child: CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.primary));
          } else if (state is ProductLoaded) {
            return ReorderableListView(
                shrinkWrap: true,
                children: [
                  for (int index = 0; index < state.products.length; index++)
                    ProductListTile(
                      product: state.products[index],
                      onTap: (() {}),
                      key: ValueKey(state.products[index].id),
                    ),
                ],
                onReorder: ((oldIndex, newIndex) {
                  context.read<ProductBloc>().add(
                      SortProducts(oldIndex: oldIndex, newIndex: newIndex));
                }));
          } else {
            return const Text("Error");
          }
        }),
      ],
    ),
  );
}
