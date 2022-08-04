import 'package:flutter/material.dart';
import 'package:restaurant_admin_panel/config/responsive.dart';

import 'package:restaurant_admin_panel/model/opening_hour_model.dart';

class OpeningHourSettings extends StatelessWidget {
  final OpeningHours openingHours;
  final Function(bool?)? onCheckboxChanged;
  final Function(RangeValues)? onSliderChange;
  const OpeningHourSettings({
    Key? key,
    required this.openingHours,
    this.onCheckboxChanged,
    this.onSliderChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = Responsive.isMobile(context) ? 110 : 55;
    EdgeInsets padding = Responsive.isMobile(context)
        ? const EdgeInsets.all(10)
        : const EdgeInsets.all(20.00);
    return Container(
      height: height,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      padding: padding,
      color: Theme.of(context).colorScheme.background,
      child: Responsive.isMobile(context)
          ? Column(
              children: [
                Row(
                  children: [
                    _buildCheckBox(context),
                    const SizedBox(width: 10),
                    _buildText(context),
                  ],
                ),
                const SizedBox(height: 10),
                Expanded(child: _buildSlider(context)),
              ],
            )
          : Row(
              children: [
                _buildCheckBox(context),
                const SizedBox(height: 10),
                Expanded(child: _buildSlider(context)),
                const SizedBox(width: 10),
                _buildText(context),
              ],
            ),
    );
  }

  SizedBox _buildText(BuildContext context) {
    return SizedBox(
      width: 125,
      child: openingHours.isOpen
          ? Text('Open from ${openingHours.openAt} to ${openingHours.closeAt}',
              style: Theme.of(context).textTheme.headline5)
          : Text(
              'Closed on ${openingHours.day}',
              style: Theme.of(context).textTheme.headline5,
            ),
    );
  }

  Row _buildCheckBox(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: openingHours.isOpen,
          onChanged: onCheckboxChanged,
          activeColor: Theme.of(context).colorScheme.primary,
          fillColor:
              MaterialStateProperty.all(Theme.of(context).colorScheme.primary),
        ),
        const SizedBox(width: 10),
        SizedBox(
          width: 100,
          child: Text(
            openingHours.day,
            style: Theme.of(context).textTheme.headline5,
          ),
        )
      ],
    );
  }

  RangeSlider _buildSlider(BuildContext context) {
    return RangeSlider(
      divisions: 24,
      min: 0,
      max: 24,
      values: RangeValues(openingHours.openAt, openingHours.closeAt),
      onChanged: onSliderChange,
    );
  }
}
