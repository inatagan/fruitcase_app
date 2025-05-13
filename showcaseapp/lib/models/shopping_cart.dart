class ShoppingCart {
  final List<CartItem> items;

  ShoppingCart({List<CartItem>? items}) : items = items ?? [];

  double get totalPrice =>
      items.fold(0, (sum, item) => sum + item.price * item.quantity);

  void addItem(CartItem item) {
    items.add(item);
  }

  void removeItem(CartItem item) {
    items.remove(item);
  }

  void clear() {
    items.clear();
  }
}

class CartItem {
  final String id;
  final String name;
  final double price;
  int quantity;

  CartItem({
    required this.id,
    required this.name,
    required this.price,
    this.quantity = 1,
  });
}
