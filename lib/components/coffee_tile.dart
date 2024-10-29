import 'package:caffino_coffee_shop_app/constatns.dart';
import 'package:caffino_coffee_shop_app/models/coffee.dart';
import 'package:flutter/material.dart';

class CoffeeTile extends StatelessWidget {
  const CoffeeTile({
    super.key,
    required this.coffee,
    required this.onPressed,
    required this.icon,
  });

  final Coffee coffee;
  final void Function()? onPressed;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: kCardColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        title: Text(
          coffee.name,
          style: const TextStyle(
            color: kPrimaryColor,
            fontSize: 20,
          ),
        ),
        subtitle: Text(
          '£ ${coffee.price.toStringAsFixed(2)}',
          style: const TextStyle(
            color: kPrimaryColor,
            fontSize: 18,
          ),
        ),
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: kMaybeColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Image.asset(coffee.imagePath),
        ),
        trailing: IconButton(
          onPressed: onPressed,
          icon: icon,
          color: kPrimaryColor,
        ),
      ),
    );
  }
}
