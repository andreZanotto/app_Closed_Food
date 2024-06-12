import 'package:flutter/material.dart';
import 'package:closedFood/models/product.dart';
import 'package:closedFood/models/cart.dart';
import 'cart_screen.dart';

class ProductListScreen extends StatefulWidget {
  final Cart cart;

  ProductListScreen({required this.cart});

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final List<Product> _products = [
    Product(
      id: '1',
      name: 'Apple',
      price: 1.5,
      imageUrl: 'https://example.com/apple.jpg',
    ),
    Product(
      id: '2',
      name: 'Banana',
      price: 1.2,
      imageUrl: 'https://example.com/banana.jpg',
    ),
    // Adicione mais produtos conforme necessário
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Marketplace'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CartScreen(cart: widget.cart),
                ),
              );
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index) {
          final product = _products[index];
          return ListTile(
            leading: Image.network(product.imageUrl),
            title: Text(product.name),
            subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
            trailing: IconButton(
              icon: Icon(Icons.add_shopping_cart),
              onPressed: () {
                setState(() {
                  widget.cart.addItem(product);
                });
              },
            ),
          );
        },
      ),
    );
  }
}
