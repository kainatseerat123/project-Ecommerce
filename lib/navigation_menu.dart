import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project_ecommerce/profile_screen.dart';
import 'package:project_ecommerce/wishlist_manager.dart';
import 'package:project_ecommerce/wishlist_screen.dart';

import 'cart_screen.dart';
import 'home_screen.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  final WishlistManager wishlistManager = WishlistManager(); // create manager
  late List<Widget> screens; // declare without initializing
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    screens = [
      const HomeScreen(),
      const CartScreen(),
      WishlistScreen(wishlistManager: wishlistManager), // pass the instance
      const ProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],

      bottomNavigationBar: NavigationBar(
        height: 80,
        elevation: 0,
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
          NavigationDestination(icon: Icon(Iconsax.shopping_cart), label: 'Cart'),
          NavigationDestination(icon: Icon(Iconsax.heart), label: 'Wishlist'),
          NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
        ],
      ),
    );
  }
}