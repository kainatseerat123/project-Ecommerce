class CartManager {
  static final CartManager _instance = CartManager._internal();
  factory CartManager() => _instance;
  CartManager._internal();

  final List<Map<String, dynamic>> _cartItems = [];

  List<Map<String, dynamic>> get cartItems => _cartItems;

  void addToCart(String name, int price, String image) {
    final index = _cartItems.indexWhere((item) => item["name"] == name);
    if (index != -1) {
      _cartItems[index]["quantity"]++;
    } else {
      _cartItems.add({
        "name": name,
        "price": price,
        "quantity": 1,
        "image": image,
      });
    }
  }

  void increaseQty(int index) {
    _cartItems[index]["quantity"]++;
  }

  void decreaseQty(int index) {
    if (_cartItems[index]["quantity"] > 1) {
      _cartItems[index]["quantity"]--;
    } else {
      _cartItems.removeAt(index);
    }
  }

  int getTotalPrice() {
    int total = 0;
    for (var item in _cartItems) {
      total += (item["price"] as int) * (item["quantity"] as int);
    }
    return total;
  }
}
