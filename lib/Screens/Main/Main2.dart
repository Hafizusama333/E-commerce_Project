import 'package:ecommerce_app/Screens/Main/Main3.dart';
import 'package:ecommerce_app/Screens/Main/Mainscreen.dart';
import 'package:ecommerce_app/Screens/Main/categories.dart';
import 'package:ecommerce_app/contants/colors.dart';
import 'package:flutter/material.dart';

class Main2 extends StatefulWidget {
  @override
  State<Main2> createState() => _Main2State();
}

class _Main2State extends State<Main2> {
  bool showAllProducts = false;
  bool showsaleProducts = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Main3()),
                );
              },
              child: Container(
                height: 250,
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/main2img.png',
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                    Positioned(
                      left: 16,
                      bottom: 60,
                      child: Text(
                        'Street clothes',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            SaleSectionWidget(
              showsaleProducts: showsaleProducts,
              onViewAllToggle: () {
                setState(() {
                  showsaleProducts = !showsaleProducts;
                });
              },
              products: salesproducts,
            ),
            NewSectionWidget(
              showAllProducts: showAllProducts,
              onViewAllToggle: () {
                setState(() {
                  showAllProducts = !showAllProducts;
                });
              },
              products: products,
            ),
          ],
        ),
      ),
    );
  }
}

class SaleSectionWidget extends StatefulWidget {
  final bool showsaleProducts;
  final Function onViewAllToggle;
  final List<Product> products;

  SaleSectionWidget({
    required this.showsaleProducts,
    required this.onViewAllToggle,
    required this.products,
  });

  @override
  _SaleSectionWidgetState createState() => _SaleSectionWidgetState();
}

class _SaleSectionWidgetState extends State<SaleSectionWidget> {
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
                    'SALE',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Super Summer Sale',
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
                  widget.showsaleProducts ? 'Show Less' : 'View All',
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
          itemCount: widget.showsaleProducts ? widget.products.length : 2,
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
                      color: primaryclr,
                      child: Text(
                        'SALE',
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
