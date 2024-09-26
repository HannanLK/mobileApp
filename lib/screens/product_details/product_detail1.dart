import 'package:flutter/material.dart';

class ProductDetail1 extends StatelessWidget {
  const ProductDetail1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nike Sneakers'),
      ),
      body: const Center(
        child: Text(
          'Product Details for Nike Sneakers',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
