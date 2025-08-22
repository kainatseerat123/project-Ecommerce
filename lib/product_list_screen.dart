import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget {
  final String category; // user jo category click karega
  final List<Map<String, String>> products; // products list

  const ProductListScreen({
    super.key,
    required this.category,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text("$category Products"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true, // gradient ke sath merge hoga
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: isDark
                ? const [
              Color(0xFF1C1C1E), // dark grey
              Color(0xFF3A1C71), // deep purple
              Color(0xFF000000), // black
            ]
                : [
              Colors.lightBlueAccent.shade200,
              const Color(0xFFFFC1CC),
              const Color(0xFFB39DDB),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 products ek row me
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.75,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return _buildProductCard(product, isDark);
              },
            ),
          ),
        ),
      ),
    );
  }

  //  Product Card Widget
  Widget _buildProductCard(Map<String, String> product, bool isDark) {
    return Container(
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[900] : Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 🔹 Product Image
          Image.asset(
            product["image"] ?? "assets/images/placeholder.png",
            height: 80,
            width: 80,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 10),
          Text(
            product["name"] ?? "Product",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            product["price"] ?? "₹0",
            style: TextStyle(
              fontSize: 14,
              color: isDark ? Colors.grey[300] : Colors.black54,
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text("Add to Cart"),
          ),
        ],
      ),
    );
  }
}
