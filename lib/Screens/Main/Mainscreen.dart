import 'package:ecommerce_app/Screens/Main/Main2.dart';
import 'package:ecommerce_app/Screens/Main/categories.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/contants/colors.dart'; // Assuming you have this file for primaryclr

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool showAllProducts = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Stack for image and text
            Container(
              height: 500, // Adjust the height as needed
              child: Stack(
                children: [
                  Image.asset(
                    'assets/Mainimage.png',
                    fit: BoxFit.cover,
                    width: double
                        .infinity, // Make sure the image covers the full width
                  ),
                  Positioned(
                    left: 16,
                    bottom: 70,
                    child: Text(
                      'Fashion\n Sale',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 16,
                    bottom: 16,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => Main2()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryclr,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      ),
                      child: Text(
                        'Check',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Spacer to separate the image section from the grid view
            SizedBox(height: 16),
            NewSectionWidget(
              showAllProducts: showAllProducts,
              onViewAllToggle: () {
                setState(() {
                  showAllProducts = !showAllProducts;
                });
              },
              products: products,
            ),
            // Row for the "NEW" text, subtext, and "View All" button
          ],
        ),
      ),
    );
  }
}

class NewSectionWidget extends StatefulWidget {
  final bool showAllProducts;
  final Function onViewAllToggle;
  final List<Product> products;

  NewSectionWidget({
    required this.showAllProducts,
    required this.onViewAllToggle,
    required this.products,
  });

  @override
  _NewSectionWidgetState createState() => _NewSectionWidgetState();
}

class _NewSectionWidgetState extends State<NewSectionWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'NEW',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'You have never seen it before',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              Spacer(),
              TextButton(
                onPressed: () => widget.onViewAllToggle(),
                child: Text(
                  widget.showAllProducts ? 'Show Less' : 'View All',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16),
        // Grid view for products
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 0.75, // Adjust aspect ratio to fit your design
          ),
          itemCount: widget.showAllProducts ? widget.products.length : 2,
          itemBuilder: (context, index) {
            final product = widget.products[index];
            return Card(
              elevation: 6.0,
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Center(
                          child: Image.asset(
                            product.imagepath,
                            fit: BoxFit.contain,
                            width: double.infinity,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          product.title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Rs. ${product.price}',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      color: Colors.black,
                      child: Text(
                        'New',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
