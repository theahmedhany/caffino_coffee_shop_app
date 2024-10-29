import 'package:caffino_coffee_shop_app/constatns.dart';
import 'package:caffino_coffee_shop_app/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 120, right: 95),
              child: Image.asset(
                'assets/images/loog.png',
                width: 400,
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              'Caffino',
              style: TextStyle(
                fontSize: 40,
                color: kPrimaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              'How would you like your coffee?',
              style: TextStyle(
                fontSize: 22,
                color: kPrimaryColor,
              ),
            ),
            const SizedBox(height: 80),
            CupertinoButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              },
              padding: EdgeInsets.zero,
              child: Container(
                width: 350,
                height: 70,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Center(
                  child: Text(
                    'Enter Shop',
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
