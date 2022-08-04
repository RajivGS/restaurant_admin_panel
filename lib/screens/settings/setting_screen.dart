// ignore_for_file: dead_code, sort_child_properties_last, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_admin_panel/blocs/setting_bloc/setting_bloc.dart';
import 'package:restaurant_admin_panel/config/responsive.dart';

import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_drawer.dart';
import '../../widgets/custom_layout.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../widgets/opening_hour_widget.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const CustomDrawer(),
      body: CustomLayout(
        title: 'Settings',
        widgets: [
          _buildImage(),
          Responsive.isDesktop(context) || Responsive.isWideDesktop(context)
              ? IntrinsicHeight(
                  child: Row(
                    children: [
                      Expanded(
                        child: _buildBasicInformation(context),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _buildRestaurantInformation(context),
                      ),
                    ],
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildBasicInformation(context),
                    const SizedBox(height: 10),
                    _buildRestaurantInformation(context),
                  ],
                ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              'Opening Hours',
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          _buildOpeningHours(),
        ],
      ),
    );
  }

  BlocBuilder<SettingBloc, SettingState> _buildOpeningHours() {
    return BlocBuilder<SettingBloc, SettingState>(
      builder: (context, state) {
        if (state is SettingLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is SettingLoaded) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.restaurant.openingHours!.length,
            itemBuilder: ((context, index) {
              var openingHours = state.restaurant.openingHours![index];
              return OpeningHourSettings(
                openingHours: openingHours,
                onSliderChange: (value) {
                  context.read<SettingBloc>().add(UpdateOpeningHours(
                      openingHours: openingHours.copyWith(
                          openAt: value.start, closeAt: value.end)));
                },
                onCheckboxChanged: (value) {
                  context.read<SettingBloc>().add(UpdateOpeningHours(
                        openingHours:
                            openingHours.copyWith(isOpen: !openingHours.isOpen),
                      ));
                },
              );
            }),
          );
        } else {
          return Text('Somethign is wrong');
        }
      },
    );
  }

  Container _buildBasicInformation(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      padding: EdgeInsets.all(20.0),
      child: BlocBuilder<SettingBloc, SettingState>(
        builder: (context, state) {
          if (state is SettingLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is SettingLoaded) {
            return Column(
              children: [
                Text(
                  "Basic Information",
                  style: Theme.of(context).textTheme.headline4,
                ),
                SizedBox(height: 20),
                CustomTextFormField(
                  title: 'Name',
                  hasTitle: true,
                  maxLines: 1,
                  initialValue: (state.restaurant.name != null)
                      ? state.restaurant.name!
                      : '',
                  onChanged: (value) {
                    context.read<SettingBloc>().add(UpdateSettings(
                        restaurant: state.restaurant.copyWith(name: value)));
                  },
                ),
                CustomTextFormField(
                  title: 'Image',
                  hasTitle: true,
                  maxLines: 1,
                  initialValue: (state.restaurant.imageUrl != null)
                      ? state.restaurant.imageUrl!
                      : '',
                  onChanged: (value) {
                    context.read<SettingBloc>().add(UpdateSettings(
                        restaurant:
                            state.restaurant.copyWith(imageUrl: value)));
                  },
                ),
                CustomTextFormField(
                  title: 'Tags',
                  hasTitle: true,
                  maxLines: 1,
                  initialValue: (state.restaurant.tags != null)
                      ? state.restaurant.tags!.join(',')
                      : '',
                  onChanged: (value) {
                    context.read<SettingBloc>().add(UpdateSettings(
                        restaurant: state.restaurant
                            .copyWith(tags: value.split(', '))));
                  },
                ),
              ],
            );
          } else {
            return Text('Something is wrong');
          }
        },
      ),
    );
  }

  Container _buildRestaurantInformation(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      padding: EdgeInsets.all(20.0),
      child: BlocBuilder<SettingBloc, SettingState>(
        builder: (context, state) {
          if (state is SettingLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is SettingLoaded) {
            return Column(
              children: [
                Text(
                  "Restaurant Description",
                  style: Theme.of(context).textTheme.headline4,
                ),
                SizedBox(height: 20),
                CustomTextFormField(
                  title: 'Description',
                  hasTitle: true,
                  maxLines: 5,
                  initialValue: (state.restaurant.description != null)
                      ? state.restaurant.description!
                      : '',
                  onChanged: (value) {
                    context.read<SettingBloc>().add(UpdateSettings(
                        restaurant:
                            state.restaurant.copyWith(description: value)));
                  },
                ),
              ],
            );
          } else {
            return Text('Something is wrong');
          }
        },
      ),
    );
  }

  BlocBuilder<SettingBloc, SettingState> _buildImage() {
    return BlocBuilder<SettingBloc, SettingState>(
      builder: (context, state) {
        if (state is SettingLoading) {
          return const SizedBox();
        }
        if (state is SettingLoaded) {
          return (state.restaurant.imageUrl != null)
              ? Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https:images.unsplash.com/photo-1517248135467-4c7edcad34c4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80'),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : const SizedBox();
        } else {
          return const Text('Something is wrong!');
        }
      },
    );
  }
}
