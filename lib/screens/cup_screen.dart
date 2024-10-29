import 'package:caffino_coffee_shop_app/components/custom_alert_dialog.dart';
import 'package:caffino_coffee_shop_app/constatns.dart';
import 'package:caffino_coffee_shop_app/models/coffee.dart';
import 'package:caffino_coffee_shop_app/models/coffee_shop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CupScreen extends StatefulWidget {
  const CupScreen({super.key, required this.coffee});
  final Coffee coffee;

  @override
  State<CupScreen> createState() => _CupScreenState();
}

class _CupScreenState extends State<CupScreen> {
  int number = 1;
  String selectedSize = 'M';

  void addToCart(Coffee coffee) {
    Coffee updatedCoffee = Coffee(
      name: coffee.name,
      imagePath: coffee.imagePath,
      price: coffee.price,
      quantity: number,
      size: selectedSize,
    );

    Provider.of<CoffeeShop>(context, listen: false)
        .addItemToCart(updatedCoffee);

    showDialog(
      context: context,
      builder: (context) => const CustomAlertDialog(
        text: 'Added to cart successfully',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        forceMaterialTransparency: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: kPrimaryColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.coffee.name,
              style: const TextStyle(
                fontSize: 28,
                color: kPrimaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: Container(
                width: 220,
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: kMaybeColor,
                  borderRadius: BorderRadius.circular(70),
                ),
                child: Image.asset(widget.coffee.imagePath),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'QUANTITY',
              style: TextStyle(
                fontSize: 26,
                color: kPrimaryColor,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (number > 0) number--;
                    });
                  },
                  icon: const Icon(
                    Icons.remove,
                    size: 28,
                    color: kPrimaryColor,
                  ),
                ),
                const SizedBox(width: 20),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: kCardColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      number.toString(),
                      style: const TextStyle(
                        color: kPrimaryColor,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                IconButton(
                  onPressed: () {
                    setState(() {
                      number++;
                    });
                  },
                  icon: const Icon(
                    Icons.add,
                    size: 28,
                    color: kPrimaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              'SIZE',
              style: TextStyle(
                fontSize: 26,
                color: kPrimaryColor,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSizeOption('S'),
                const SizedBox(width: 8),
                _buildSizeOption('M'),
                const SizedBox(width: 8),
                _buildSizeOption('L'),
              ],
            ),
            const SizedBox(height: 50),
            CupertinoButton(
              onPressed: () {
                addToCart(widget.coffee);
              },
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
                    'Add to cart',
                    style: TextStyle(
                      color: kBackgroundColor,
                      fontSize: 22,
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

  Widget _buildSizeOption(String size) {
    bool isSelected = selectedSize == size;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSize = size;
        });
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: isSelected ? kSecondaryColor : kCardColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            size,
            style: TextStyle(
              color: isSelected ? kBackgroundColor : kPrimaryColor,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
