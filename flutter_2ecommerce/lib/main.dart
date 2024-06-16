import 'package:flutter/material.dart';
import 'package:flutter_2ecommerce/models/shop.dart';
import 'package:flutter_2ecommerce/pages/cart_page.dart';
import 'package:flutter_2ecommerce/pages/intro_page.dart';
import 'package:flutter_2ecommerce/pages/shop_page.dart';
import 'package:flutter_2ecommerce/themes/light_mode.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => Shop(),child: MyApp(),)
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/intropage': (context) => const IntroPage(),
        '/shoppage': (context) => const ShopPage(),
        '/cartpage': (context) => const CartPage()
      },
      theme: lightMode,
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
    );
  }
}