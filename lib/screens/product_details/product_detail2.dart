import 'package:flutter/material.dart';

class ProductDetail2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adidas Sports Shoe'),
      ),
      body: const Center(
        child: Text(
          'Product Details for Adidas Sports Shoe',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
