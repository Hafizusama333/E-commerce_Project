import 'package:ecommerce_app/Screens/Home/Home.dart';
import 'package:ecommerce_app/Screens/categories/categories2.dart';
import 'package:ecommerce_app/contants/colors.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
          ),
          title: Text(
            'Categories',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(text: 'Women'),
              Tab(text: 'Men'),
              Tab(text: 'Kids'),
            ],
            labelColor: primaryclr,
            indicatorColor: primaryclr,
          ),
        ),
        body: Column(
          children: [
            Container(
              color: primaryclr,
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'SUMMER SALES',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Up to 50% off',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16.0),
                child: TabBarView(
                  children: [
                    CategoryListView(),
                    CategoryListView(),
                    CategoryListView(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CategoryTile(
          title: 'New',
          imagePath: 'assets/images/new.png',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Categories2()),
            );
          },
        ),
        CategoryTile(
          title: 'Clothes',
          imagePath: 'assets/images/clothes.png',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Categories2()),
            );
          }, // Replace with actual image path
        ),
        CategoryTile(
          title: 'Shoes',
          imagePath: 'assets/images/shoes.png',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Categories2()),
            );
          }, // Replace with actual image path
        ),
        CategoryTile(
          title: 'Accessories',
          imagePath: 'assets/images/assessories.png',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Categories2()),
            );
          }, // Replace with actual image path
        ),
      ],
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback onTap;

  const CategoryTile(
      {required this.title, required this.imagePath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 4.0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
