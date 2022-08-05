import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_admin_panel/blocs/blocs.dart';
import 'package:restaurant_admin_panel/model/category_model.dart';
import 'package:restaurant_admin_panel/widgets/custom_text_form_field.dart';
import '../model/product_model.dart';
import 'custom_drop_down_button.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final int index;
  const ProductCard({
    required this.product,
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: 150,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: (index == 0)
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            ProductModel product = ProductModel(
                                id: '',
                                name: '',
                                category: '',
                                description: '',
                                imageUrl: '',
                                price: 0);
                            return Dialog(
                              child: Container(
                                height: 450,
                                width: 500,
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  children: [
                                    Text('Add a product',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline2),
                                    const SizedBox(height: 20),
                                    CustomDropDownButton(
                                      items: CategoryModel.categories
                                          .map((category) => category.name)
                                          .toList(),
                                      onChanged: ((value) {
                                        product =
                                            product.copyWith(category: value);
                                        print(product);
                                      }),
                                    ),
                                    const SizedBox(height: 10),
                                    CustomTextFormField(
                                        maxLines: 1,
                                        title: 'Name',
                                        hasTitle: true,
                                        initialValue: '',
                                        onChanged: (value) {
                                          product =
                                              product.copyWith(name: value);
                                        }),
                                    CustomTextFormField(
                                        maxLines: 1,
                                        title: 'Price',
                                        hasTitle: true,
                                        initialValue: '',
                                        onChanged: (value) {
                                          product = product.copyWith(
                                              price: double.parse(value));
                                        }),
                                    CustomTextFormField(
                                        maxLines: 1,
                                        title: 'Image Url',
                                        hasTitle: true,
                                        initialValue: '',
                                        onChanged: (value) {
                                          product =
                                              product.copyWith(imageUrl: value);
                                        }),
                                    CustomTextFormField(
                                        maxLines: 3,
                                        title: 'Description',
                                        hasTitle: true,
                                        initialValue: '',
                                        onChanged: (value) {
                                          product = product.copyWith(
                                              description: value);
                                        }),
                                    ElevatedButton(
                                      onPressed: () {
                                        BlocProvider.of<ProductBloc>(context)
                                            .add(
                                          AddProducts(productsModel: product),
                                        );
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        'Save',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5!
                                            .copyWith(color: Colors.white),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    iconSize: 40,
                    icon: Icon(Icons.add_circle,
                        color: Theme.of(context).primaryColor)),
                Text(
                  'Add a product',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(product.imageUrl),
                ),
                Text(
                  product.name,
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text(
                  '\$${product.price}',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ],
            ),
    );
  }
}
