import 'package:flutter/material.dart';
import 'wishlist_manager.dart';

class WishlistScreen extends StatefulWidget {
  final WishlistManager wishlistManager;

  const WishlistScreen({super.key, required this.wishlistManager});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    final wishlistItems = widget.wishlistManager.wishlistItems;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Wishlist ❤️"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isDark
                ? const [Color(0xFF0D47A1), Color(0xFF880E4F), Color(0xFF4A148C)]
                : const [Color(0xFF6EB6F9), Color(0xFFE4A6C8), Color(0xFFB49FDC)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: wishlistItems.isEmpty
            ? const Center(
          child: Text(
            "No items in wishlist",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        )
            : ListView.builder(
          itemCount: wishlistItems.length,
          itemBuilder: (context, index) {
            final item = wishlistItems[index];
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    item["image"],
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  item["name"],
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "₹${item["price"]}",
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    setState(() {
                      widget.wishlistManager.removeFromWishlist(item["name"]);
                    });
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
