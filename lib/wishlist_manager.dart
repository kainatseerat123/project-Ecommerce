import 'package:flutter/material.dart';

class WishlistManager extends ChangeNotifier {
  final List<Map<String, dynamic>> _wishlistItems = [];

  List<Map<String, dynamic>> get wishlistItems => _wishlistItems;

  void addToWishlist(Map<String, dynamic> product) {
    // Duplicate avoid karna
    if (!_wishlistItems.any((item) => item["name"] == product["name"])) {
      _wishlistItems.add(product);
      notifyListeners();
    }
  }

  void removeFromWishlist(String name) {
    _wishlistItems.removeWhere((item) => item["name"] == name);
    notifyListeners();
  }
}
