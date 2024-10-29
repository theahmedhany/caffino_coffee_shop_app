import 'package:caffino_coffee_shop_app/models/coffee.dart';
import 'package:flutter/material.dart';

class CoffeeShop extends ChangeNotifier {
  // Coffee for sale
  final List<Coffee> _shop = [
    Coffee(
      name: 'Black Coffee',
      price: 15,
      imagePath: 'assets/images/long_black.png',
    ),
    Coffee(
      name: 'Latte',
      price: 20,
      imagePath: 'assets/images/latte.png',
    ),
    Coffee(
      name: 'Espresso',
      price: 35,
      imagePath: 'assets/images/espresso.png',
    ),
    Coffee(
      name: 'Ice Coffee',
      price: 55,
      imagePath: 'assets/images/iced_coffee.png',
    ),
    Coffee(
      name: 'Americano',
      price: 24,
      imagePath: 'assets/images/americano.png',
    ),
    Coffee(
      name: 'Cortado',
      price: 44,
      imagePath: 'assets/images/Cortado.png',
    ),
    Coffee(
      name: 'Mocha',
      price: 72,
      imagePath: 'assets/images/Mocha.png',
    ),
    Coffee(
      name: 'Cappuccino',
      price: 63,
      imagePath: 'assets/images/cappuccino.png',
    ),
  ];

  // User cart
  List<Coffee> _userCart = [];

  // Get coffee list
  List<Coffee> get coffeeShop => _shop;

  // Get user cart
  List<Coffee> get userCart => _userCart;

  // Add item to cart
  void addItemToCart(Coffee coffee) {
    _userCart.add(coffee);
    notifyListeners();
  }

  // Remove item to cart
  void removeItemFromCart(Coffee coffee) {
    _userCart.remove(coffee);
    notifyListeners();
  }
}
