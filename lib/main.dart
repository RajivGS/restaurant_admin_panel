import 'package:flutter/material.dart';

import 'config/theme.dart';
import 'screens/menu_screen.dart';
import 'widgets/custom_scroll_behavior.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Food Delivery Backend',
      theme: theme(),
      initialRoute: '/menu',
      routes: {
        '/menu': (context) => const MenuScreen(),
      },
    );
  }
}
