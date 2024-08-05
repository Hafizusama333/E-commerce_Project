import 'package:ecommerce_app/Screens/catlog/productcard.dart';
import 'package:ecommerce_app/contants/colors.dart';
import 'package:flutter/material.dart';

class Catalog1 extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _Catalog1State createState() => _Catalog1State();
}

class _Catalog1State extends State<Catalog1> {
  final List<Map<String, dynamic>> products = [
    {
      'title': 'Pullover',
      'brand': 'Mango',
      'price': 51,
      'rating': 4.0,
      'reviews': 3,
      'image': 'assets/images/women1.png'
    },
    {
      'title': 'Blouse',
      'brand': 'Dorothy Perkins',
      'price': 34,
      'rating': 0.0,
      'reviews': 0,
      'image': 'assets/images/women3.png'
    },
    {
      'title': 'T-shirt',
      'brand': 'LOST Ink',
      'price': 12,
      'rating': 5.0,
      'reviews': 10,
      'image': 'assets/images/women1.png'
    },
    {
      'title': 'Shirt',
      'brand': 'Topshop',
      'price': 51,
      'rating': 4.0,
      'reviews': 3,
      'image': 'assets/images/women2.png'
    },
  ];

  late List<Map<String, dynamic>> filteredProducts;

  @override
  void initState() {
    super.initState();
    filteredProducts = products;
  }

  void filterProducts(String filterType,
      {double minPrice = 0, double maxPrice = double.infinity}) {
    setState(() {
      switch (filterType) {
        case 'popular':
          filteredProducts =
              products.where((product) => product['reviews'] > 5).toList();
          break;
        case 'newest':
          filteredProducts = products
              .where((product) =>
                  product['rating'] == 0.0 && product['reviews'] == 0)
              .toList();
          break;
        case 'customer_review':
          filteredProducts =
              products.where((product) => product['reviews'] > 0).toList();
          break;
        case 'price_lowest_to_highest':
          filteredProducts = products
              .where((product) =>
                  product['price'] >= minPrice && product['price'] <= maxPrice)
              .toList();
          filteredProducts.sort((a, b) => a['price'].compareTo(b['price']));
          break;
        case 'price_highest_to_lowest':
          filteredProducts = products
              .where((product) =>
                  product['price'] >= minPrice && product['price'] <= maxPrice)
              .toList();
          filteredProducts.sort((a, b) => b['price'].compareTo(a['price']));
          break;
        default:
          filteredProducts = products;
      }
    });
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
          'Women’s tops',
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {
              // Search action
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.grey[200], // Background color
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CategoryButton(label: 'T-shirts'),
                  CategoryButton(label: 'Crop tops'),
                  CategoryButton(label: 'Sleeveless'),
                  CategoryButton(label: 'Shirts'),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FilterButton(
                      onFilterSelected: (filterType, {minPrice, maxPrice}) {
                    filterProducts(filterType,
                        minPrice: minPrice ?? 0,
                        maxPrice: maxPrice ?? double.infinity);
                  }),
                  SortButton(),
                  IconButton(
                    icon: Icon(Icons.grid_view, color: Colors.black),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  return ProductCard(product: filteredProducts[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String label;

  const CategoryButton({required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ElevatedButton(
        onPressed: () {
          // Category button action
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16),
        ),
        child: Text(label),
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final void Function(String, {double? minPrice, double? maxPrice})
      onFilterSelected;

  const FilterButton({required this.onFilterSelected});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return FilterOptions(onFilterSelected: onFilterSelected);
          },
        );
      },
      icon: Icon(Icons.filter_list, color: Colors.black),
      label: Text('Filters', style: TextStyle(color: Colors.black)),
    );
  }
}

class SortButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {},
      icon: Icon(Icons.sort, color: Colors.black),
      label:
          Text('Price: lowest to high', style: TextStyle(color: Colors.black)),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(product: product),
          ),
        );
      },
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: ListTile(
          leading: Image.asset(product['image']),
          title: Text(
            product['title'],
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(product['brand'],
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Row(
                children: List.generate(5, (index) {
                  return Icon(
                    index < product['rating'] ? Icons.star : Icons.star_border,
                    color: Colors.amber,
                    size: 20,
                  );
                }),
              ),
              Text('\$${product['price']}',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          trailing: IconButton(
            icon: Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {
              // Favorite button action
            },
          ),
        ),
      ),
    );
  }
}

class FilterOptions extends StatefulWidget {
  final void Function(String, {double? minPrice, double? maxPrice})
      onFilterSelected;

  const FilterOptions({required this.onFilterSelected});

  @override
  // ignore: library_private_types_in_public_api
  _FilterOptionsState createState() => _FilterOptionsState();
}

class _FilterOptionsState extends State<FilterOptions> {
  double minPrice = 0;
  double maxPrice = 100;
  String? selectedFilter; // To keep track of the selected filter

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch, // Ensure full width
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Filter By',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        _buildFilterTile(
          label: 'Popular',
          filterType: 'popular',
        ),
        _buildFilterTile(
          label: 'Newest',
          filterType: 'newest',
        ),
        _buildFilterTile(
          label: 'Customer Review',
          filterType: 'customer_review',
        ),
        _buildFilterTile(
          label: 'Price (Lowest to Highest)',
          filterType: 'price_lowest_to_highest',
          showPriceDialog: true,
        ),
        _buildFilterTile(
          label: 'Price (Highest to Lowest)',
          filterType: 'price_highest_to_lowest',
          showPriceDialog: true,
        ),
      ],
    );
  }

  Widget _buildFilterTile({
    required String label,
    required String filterType,
    bool showPriceDialog = false,
  }) {
    return Container(
      width: double.infinity,
      color: selectedFilter == filterType ? primaryclr : Colors.white,
      child: ListTile(
        title: Text(
          label,
          style: TextStyle(
            color: selectedFilter == filterType ? Colors.white : Colors.black,
          ),
        ),
        onTap: () {
          setState(() {
            selectedFilter = filterType;
          });
          if (showPriceDialog) {
            _showPriceRangeDialog(context, filterType);
          } else {
            widget.onFilterSelected(filterType);
            Navigator.pop(context);
          }
        },
      ),
    );
  }

  void _showPriceRangeDialog(BuildContext context, String filterType) {
    showDialog(
      context: context,
      builder: (context) {
        double tempMinPrice = minPrice;
        double tempMaxPrice = maxPrice;
        return AlertDialog(
          title: Text('Select Price Range'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Min Price'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  tempMinPrice = double.tryParse(value) ?? 0;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Max Price'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  tempMaxPrice = double.tryParse(value) ?? 100;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  minPrice = tempMinPrice;
                  maxPrice = tempMaxPrice;
                });
                widget.onFilterSelected(filterType,
                    minPrice: minPrice, maxPrice: maxPrice);
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Text('Apply'),
            ),
          ],
        );
      },
    );
  }
}
