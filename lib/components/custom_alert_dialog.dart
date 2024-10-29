import 'package:caffino_coffee_shop_app/constatns.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: kThirdColor.withOpacity(0.9),
      title: Text(
        textAlign: TextAlign.center,
        text,
        style: const TextStyle(
          color: kPrimaryColor,
        ),
      ),
    );
  }
}
