import 'package:ecommerce_app/Screens/success/success.dart';
import 'package:ecommerce_app/contants/colors.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems;

  const CartScreen({required this.cartItems});

  void _navigateToSuccessScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            SuccessScreen(), // Replace with your actual success screen widget
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Cart',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: cartItems.isEmpty
                ? Center(child: Text('No items in the cart'))
                : ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      return Container(
                        color: Colors.white,
                        child: ListTile(
                          contentPadding: EdgeInsets.all(16.0),
                          leading:
                              Image.asset(item['image'], width: 50, height: 50),
                          title: Text(item['title']),
                          subtitle: Text('\$${item['price']}'),
                          trailing: IconButton(
                            icon: Icon(Icons.remove_circle, color: Colors.red),
                            onPressed: () {
                              // Handle item removal if necessary
                            },
                          ),
                        ),
                      );
                    },
                  ),
          ),
          // Checkout Button
          Container(
            padding: const EdgeInsets.all(16.0),
            width: double.infinity, // Full width
            child: ElevatedButton(
              onPressed: () => _navigateToSuccessScreen(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryclr,
                padding: EdgeInsets.symmetric(vertical: 16.0),
              ),
              child: Text(
                'Checkout',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Success Screen
