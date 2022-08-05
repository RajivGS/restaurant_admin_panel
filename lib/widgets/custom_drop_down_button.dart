import 'package:flutter/material.dart';

class CustomDropDownButton extends StatelessWidget {
  final List<String> items;
  final Function(String?)? onChanged;
  const CustomDropDownButton({
    Key? key,
    required this.items,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 75,
          child: Text('Category', style: Theme.of(context).textTheme.headline6),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: SizedBox(
            height: 45,
            child: DropdownButtonFormField(
              iconSize: 20,
              onChanged: onChanged,
              items: items
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      ))
                  .toList(),
            ),
          ),
        )
      ],
    );
  }
}
