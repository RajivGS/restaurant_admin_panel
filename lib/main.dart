import 'package:flutter/material.dart';
import 'package:restaurant_admin_panel/blocs/blocs.dart';
import 'package:restaurant_admin_panel/model/category_model.dart';
import 'package:restaurant_admin_panel/model/product_model.dart';

import 'config/theme.dart';
import 'screens/menu_screen.dart';
import 'widgets/custom_scroll_behavior.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CategoryBloc()
            ..add(LoadCategories(categories: CategoryModel.categories)),
        ),
        BlocProvider(
          create: (context) =>
              ProductBloc(categoryBloc: BlocProvider.of<CategoryBloc>(context))
                ..add(LoadProducts(productsModel: ProductModel.products)),
        )
      ],
      child: MaterialApp(
        scrollBehavior: MyCustomScrollBehavior(),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Food Delivery Backend',
        theme: theme(),
        initialRoute: '/menu',
        routes: {
          '/menu': (context) => const MenuScreen(),
        },
      ),
    );
  }
}
