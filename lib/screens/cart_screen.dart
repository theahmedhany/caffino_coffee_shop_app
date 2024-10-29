import 'package:caffino_coffee_shop_app/components/cart_coffee_tile.dart';
import 'package:caffino_coffee_shop_app/components/custom_alert_dialog.dart';
import 'package:caffino_coffee_shop_app/constatns.dart';
import 'package:caffino_coffee_shop_app/models/coffee.dart';
import 'package:caffino_coffee_shop_app/models/coffee_shop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void removeFromCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).removeItemFromCart(coffee);

    showDialog(
      context: context,
      builder: (context) => const CustomAlertDialog(
        text: 'Deleted successfully',
      ),
    );
  }

  void payNow() {}

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Row(
              children: [
                Text(
                  'Your Cart',
                  style: TextStyle(
                    fontSize: 20,
                    color: kPrimaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                itemCount: value.userCart.length,
                itemBuilder: (context, index) {
                  Coffee eachCoffee = value.userCart[index];
                  return CartCoffeeTile(
                    coffee: eachCoffee,
                    onPressed: () => removeFromCart(eachCoffee),
                    icon: const Icon(Icons.delete_outline_rounded),
                  );
                },
              ),
            ),
            CupertinoButton(
              onPressed: payNow,
              padding: EdgeInsets.zero,
              child: Container(
                width: 350,
                height: 70,
                decoration: BoxDecoration(
                  color: kSecondaryColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Center(
                  child: Text(
                    'Pay Now',
                    style: TextStyle(
                      color: kBackgroundColor,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
