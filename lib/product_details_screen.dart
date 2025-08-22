import 'package:flutter/material.dart';
import 'cart_manager.dart';
import 'wishlist_manager.dart'; // ye new manager banaya tha

class ProductDetailScreen extends StatelessWidget {
  final String name;
  final String price;
  final String description;
  final String image; // asset path ya network image

  const ProductDetailScreen({
    super.key,
    required this.name,
    required this.price,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        actions: [
          // ❤️ Wishlist Button
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.red),
              onPressed: () {
                WishlistManager().addToWishlist({
                  "name": name,
                  "price": int.parse(price.replaceAll("₹", "")),
                  "image": image,
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("$name added to wishlist!")),
                );
              }
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: isDark
                ? const [
              Color(0xFF0D47A1), // Deep Blue
              Color(0xFF880E4F), // Dark Pink
              Color(0xFF4A148C), // Deep Purple
            ]
                : const [
              Color(0xFF6EB6F9), // Light Sky Blue
              Color(0xFFE4A6C8), // Soft Pink
              Color(0xFFB49FDC), // Lavender Purple
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // 🖼 Product Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    image,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                const SizedBox(height: 20),

                // Product Name
                Text(
                  name,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onBackground,
                  ),
                ),

                const SizedBox(height: 10),

                // Product Price
                Text(
                  price,
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: Colors.greenAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                // Product Description
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurface,
                  ),
                ),

                const SizedBox(height: 30),

                // 🛒 Add to Cart Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      CartManager().addToCart(
                        name,
                        int.parse(price.replaceAll("₹", "")),
                        image,
                      );

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("$name added to cart!")),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      backgroundColor: theme.colorScheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      "Add to Cart",
                      style: TextStyle(color: theme.colorScheme.onPrimary),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
