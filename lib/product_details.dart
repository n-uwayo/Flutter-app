import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> product;

  ProductDetailsScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    Color getBackgroundColor(String productName) {
      switch (productName) {
        case 'Laptop':
          return Colors.green[700]!;
        case 'Tablet':
          return Colors.yellow[700]!;
        case 'Pen Drive':
          return Colors.red[700]!;
        case 'Pixel 1':
        default:
          return Colors.blue;
      }
    }

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.blue[100], // Light blue color for the header
            width: double.infinity,
            padding: EdgeInsets.all(16.0),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Text(
                    product['name'],
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    color: getBackgroundColor(product['name']),
                    width: double.infinity,
                    padding: EdgeInsets.all(16.0),
                    child: Center(
                      child: Text(
                        product['name'],
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Center(
                    child: Text(
                      product['description'],
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Center(
                    child: Text(
                      'Price: \$${product['price']}',
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          for (int i = 0; i < 3; i++) ...[
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: product['name'] == 'Tablet'
                                      ? Colors.red
                                      : Colors.white,
                                  size: 30.0,
                                ),
                                Icon(
                                  Icons.star_border,
                                  color: Colors.red,
                                  size: 30.0,
                                ),
                              ],
                            ),
                            if (i < 2)
                              SizedBox(width: 8.0), // Add spacing between stars
                          ],
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
