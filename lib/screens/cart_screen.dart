import 'package:flutter/material.dart';
import 'package:closedFood/models/cart.dart';

class CartScreen extends StatelessWidget {
  final Cart cart;

  CartScreen({required this.cart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: ListView.builder(
        itemCount: cart.items.length,
        itemBuilder: (context, index) {
          final item = cart.items[index];
          return ListTile(
            title: Text(item.name),
            subtitle: Text('${item.quantity} x \$${item.price.toStringAsFixed(2)}'),
            trailing: Text('\$${(item.quantity * item.price).toStringAsFixed(2)}'),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Total: \$${cart.totalAmount.toStringAsFixed(2)}',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
