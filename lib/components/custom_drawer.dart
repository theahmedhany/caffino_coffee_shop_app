import 'package:caffino_coffee_shop_app/constatns.dart';
import 'package:caffino_coffee_shop_app/screens/start_screen.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: kThirdColor.withOpacity(0.5),
          ),
          child: Center(
            child: Image.asset(
              'assets/images/loog.png',
              height: 110,
            ),
          ),
        ),
        ListTile(
          leading: const Icon(
            Icons.home,
            color: kPrimaryColor,
          ),
          title: const Text(
            'Home',
            style: TextStyle(
              color: kPrimaryColor,
            ),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.info,
            color: kPrimaryColor,
          ),
          title: const Text(
            'About',
            style: TextStyle(
              color: kPrimaryColor,
            ),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: ListTile(
            leading: const Icon(
              Icons.logout,
              color: kPrimaryColor,
            ),
            title: const Text(
              'Logout',
              style: TextStyle(
                color: kPrimaryColor,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const StartScreen(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
