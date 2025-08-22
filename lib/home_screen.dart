import 'package:flutter/material.dart';
import 'package:project_ecommerce/product_details_screen.dart';
import 'product_list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: isDark
                ? const [
              Color(0xFF0D47A1), // Deep Blue
              Color(0xFF880E4F), // Dark Pink (Wine)
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //  Search Bar
                TextField(
                  decoration: InputDecoration(
                    hintText: "Search products...",
                    prefixIcon:
                    Icon(Icons.search, color: theme.iconTheme.color),
                    filled: true,
                    fillColor: theme.cardColor.withOpacity(0.9),
                    hintStyle: TextStyle(color: theme.hintColor),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // 🏷 Categories
                Text(
                  "Categories",
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onBackground,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 60,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      categoryItem(context, "Clothing", Icons.checkroom, [
                        {
                          "name": "T-Shirt",
                          "price": "₹800",
                          "image": "assets/images/tshirt.png"
                        },
                        {
                          "name": "Jeans",
                          "price": "₹1200",
                          "image": "assets/images/jeans.png"
                        },
                        {
                          "name": "Jacket",
                          "price": "₹2500",
                          "image": "assets/images/jacket.png"
                        },
                      ]),
                      categoryItem(
                          context, "Electronics", Icons.electrical_services, [
                        {
                          "name": "Smartphone",
                          "price": "₹15,000",
                          "image": "assets/images/smartphone.png"
                        },
                        {
                          "name": "Laptop",
                          "price": "₹50,000",
                          "image": "assets/images/laptop.png"
                        },
                        {
                          "name": "Headphones",
                          "price": "₹1500",
                          "image": "assets/images/headphones.png"
                        },
                      ]),
                      categoryItem(context, "Shoes", Icons.shopping_bag, [
                        {
                          "name": "Sneakers",
                          "price": "₹2000",
                          "image": "assets/images/sneakers.png"
                        },
                        {
                          "name": "Boots",
                          "price": "₹3500",
                          "image": "assets/images/boots.png"
                        },
                      ]),
                      categoryItem(context, "Beauty", Icons.face, [
                        {
                          "name": "Lipstick",
                          "price": "₹500",
                          "image": "assets/images/lipstick.png"
                        },
                        {
                          "name": "Perfume",
                          "price": "₹1500",
                          "image": "assets/images/perfume.png"
                        },
                      ]),
                      categoryItem(context, "Home", Icons.chair, [
                        {
                          "name": "Chair",
                          "price": "₹2500",
                          "image": "assets/images/chair.png"
                        },
                        {
                          "name": "Table",
                          "price": "₹5000",
                          "image": "assets/images/table.png"
                        },
                      ]),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                //  Offer Banner
                Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: theme.cardColor.withOpacity(0.85),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      "🔥 Special Offer 🔥",
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // 🛒 Featured Products
                Text(
                  "Featured Products",
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onBackground,
                  ),
                ),
                const SizedBox(height: 10),
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.7,
                  children: [
                    productItem(
                        context, "Shoes", "₹2500", "assets/images/shoes.jpeg",
                        theme),
                    productItem(
                        context, "Watch", "₹5000", "assets/images/watch.jpeg",
                        theme),
                    productItem(context, "Headphones", "₹1500",
                        "assets/images/headphone.jpeg", theme),
                    productItem(context, "T-Shirt", "₹800",
                        "assets/images/tshirt1.jpeg", theme),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //  Category Widget (Clickable)
  static Widget categoryItem(BuildContext context, String title, IconData icon,
      List<Map<String, String>> products) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) =>
                ProductListScreen(
                  category: title,
                  products: products,
                ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: theme.cardColor.withOpacity(0.9),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Icon(icon, color: theme.iconTheme.color),
            const SizedBox(width: 8),
            Text(
              title,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  //  Product Widget
  static Widget productItem(BuildContext context, String name, String price,
      String imagePath, ThemeData theme) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) =>
                ProductDetailScreen(
                  name: name,
                  price: price,
                  description: "$name is a high-quality product with amazing features. Perfect choice for you!",
                  image: imagePath,
                ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: theme.cardColor.withOpacity(0.9),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              height: 80,
              width: 80,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 10),
            Text(
              name,
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              price,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.hintColor,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Add to cart ka logic (baad me implement karenge)
              },
              style: ElevatedButton.styleFrom(
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
          ],
        ),
      ),
    );
  }
}