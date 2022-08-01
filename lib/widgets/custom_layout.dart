import 'package:flutter/material.dart';

import '../config/responsive.dart';

class CustomLayout extends StatelessWidget {
  final String title;
  final List<Widget> widgets;
  const CustomLayout({
    Key? key,
    required this.title,
    required this.widgets,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
                    title,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  const SizedBox(height: 20),
                  ...widgets,
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
    );
  }
}
