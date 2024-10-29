import 'package:caffino_coffee_shop_app/components/coffee_tile.dart';
import 'package:caffino_coffee_shop_app/components/custom_alert_dialog.dart';
import 'package:caffino_coffee_shop_app/constatns.dart';
import 'package:caffino_coffee_shop_app/models/coffee.dart';
import 'package:caffino_coffee_shop_app/models/coffee_shop.dart';
import 'package:caffino_coffee_shop_app/screens/cup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  void addToCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).addItemToCart(coffee);

    showDialog(
      context: context,
      builder: (context) => const CustomAlertDialog(
        text: 'Added to cart successfully',
      ),
    );
  }

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
                  'How would you like your coffee?',
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
                itemCount: value.coffeeShop.length,
                itemBuilder: (context, index) {
                  Coffee eachCoffee = value.coffeeShop[index];
                  return CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CupScreen(
                            coffee: value.coffeeShop[index],
                          ),
                        ),
                      );
                    },
                    child: CoffeeTile(
                      coffee: eachCoffee,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CupScreen(
                              coffee: value.coffeeShop[index],
                            ),
                          ),
                        );
                      },
                      icon: const Icon(Icons.arrow_forward_ios_rounded),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
