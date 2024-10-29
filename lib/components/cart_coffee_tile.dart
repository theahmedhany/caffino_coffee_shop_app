import 'package:caffino_coffee_shop_app/constatns.dart';
import 'package:caffino_coffee_shop_app/models/coffee.dart';
import 'package:flutter/material.dart';

class CartCoffeeTile extends StatelessWidget {
  final Coffee coffee;
  final VoidCallback onPressed;
  final Widget icon;

  const CartCoffeeTile({
    super.key,
    required this.coffee,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final double totalPrice = coffee.price * coffee.quantity;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: kCardColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: kSecondaryColor.withOpacity(0.3),
              blurRadius: 6,
            ),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                width: 80,
                height: 80,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: kMaybeColor,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Image.asset(
                  coffee.imagePath,
                  width: 60,
                  height: 60,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  coffee.name,
                  style: const TextStyle(
                    fontSize: 20,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Size: ${coffee.size}',
                  style: const TextStyle(
                    fontSize: 18,
                    color: kSecondaryColor,
                  ),
                ),
                Text(
                  'Quantity: ${coffee.quantity}',
                  style: const TextStyle(
                    fontSize: 18,
                    color: kSecondaryColor,
                  ),
                ),
                Text(
                  'Total Price: £ ${totalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 18,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                decoration: BoxDecoration(
                  color: kMaybeColor,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: IconButton(
                  onPressed: onPressed,
                  icon: icon,
                  color: kPrimaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
