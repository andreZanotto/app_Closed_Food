import 'package:flutter/material.dart';
import 'package:closedFood/models/cart.dart';
import 'package:closedFood/screens/product_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Cart cart = Cart();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Marketplace',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: ProductListScreen(cart: cart),
    );
  }
}
