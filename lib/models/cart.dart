import 'package:closedFood/models/product.dart';

class CartItem {
  final String id;
  final String name;
  late final int quantity;
  final double price;

  CartItem({
    required this.id,
    required this.name,
    required this.quantity,
    required this.price,
  });
}

class Cart {
  final List<CartItem> items = [];

  void addItem(Product product) {
    final existingItemIndex = items.indexWhere((item) => item.id == product.id);
    if (existingItemIndex >= 0) {
      items[existingItemIndex].quantity += 1;
    } else {
      items.add(CartItem(
        id: product.id,
        name: product.name,
        quantity: 1,
        price: product.price,
      ));
    }
  }

  double get totalAmount {
    return items.fold(0.0, (sum, item) => sum + (item.price * item.quantity));
  }
}

