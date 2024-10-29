import 'package:caffino_coffee_shop_app/models/coffee_shop.dart';
import 'package:caffino_coffee_shop_app/screens/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CoffeeShop(),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'AfacadFlux',
        ),
        home: const StartScreen(),
      ),
    );
  }
}
