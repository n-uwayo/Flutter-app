import 'package:flutter/material.dart';
import 'product_details.dart'; // Ensure this file is correctly named and placed in the 'lib' folder

void main() {
  runApp(ProductNavigationApp());
}

class ProductNavigationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Navigation App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      'name': 'Pixel 1',
      'description': 'Pixel is the most fearful phone ever.',
      'price': 800,
    },
    {
      'name': 'Laptop',
      'description': 'Laptop is the most productive development tool.',
      'price': 2000,
    },
    {
      'name': 'Tablet',
      'description': 'Tablet is the most useful device ever for meeting.',
      'price': 1500,
    },
    {
      'name': 'Pen Drive',
      'description': 'Pen Drive is a stylish phone ever.',
      'price': 100,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index]['name']),
            subtitle: Text('\$${products[index]['price']}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ProductDetailsScreen(product: products[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
