

//New Product list for Main page.
class Product {
  const Product({
    required this.imagepath,
    required this.title,
    required this.price,
    this.onSale = false,
    this.description,
  });

  final String imagepath;
  final String title;
  final int price;
  final bool onSale;
  final String? description;
}

const List<Product> products = <Product>[
  Product(
    imagepath: 'assets/productphoto.png',
    title: 'Blouse',
    price: 30,
    description: "The perfect Blouse for girls",
    onSale: true,
  ),
  Product(
    imagepath: 'assets/productphoto1.png',
    title: 'T-shirt Sailing',
    price: 300,
    description: "The perfect T-shirt for boys",
    onSale: true,
  ),
  Product(
    imagepath: 'assets/productphoto.png',
    title: 'Blouse',
    price: 30,
    description: "The perfect Blouse for girls",
    onSale: true,
  ),
  Product(
    imagepath: 'assets/productphoto1.png',
    title: 'T-shirt Sailing',
    price: 300,
    description: "The perfect T-shirt for boys",
    onSale: true,
  ),
  Product(
    imagepath: 'assets/productphoto.png',
    title: 'Blouse',
    price: 30,
    description: "The perfect Blouse for girls",
    onSale: true,
  ),
  Product(
    imagepath: 'assets/productphoto1.png',
    title: 'T-shirt Sailing',
    price: 300,
    description: "The perfect T-shirt for boys",
    onSale: true,
  ),
];

//Sales list for main2 page
const List<Product> salesproducts = <Product>[
  Product(
    imagepath: 'assets/Saleimg.png',
    title: 'Evening Dress',
    price: 4500,
    description: "this the evening dress for the girls , pink colored",
    onSale: true,
  ),
  Product(
    imagepath: 'assets/saleimg2.png',
    title: 'sport dress',
    price: 2000,
    description: "This is sport dress for the girls , blue colored",
    onSale: true,
  ),
  Product(
    imagepath: 'assets/Saleimg.png',
    title: 'Evening Dress',
    price: 4500,
    description: "this the evening dress for the girls , pink colored",
    onSale: true,
  ),
  Product(
    imagepath: 'assets/saleimg2.png',
    title: 'sport dress',
    price: 2000,
    description: "This is sport dress for the girls , blue colored",
    onSale: true,
  ),
  Product(
    imagepath: 'assets/Saleimg.png',
    title: 'Evening Dress',
    price: 4500,
    description: "this the evening dress for the girls , pink colored",
    onSale: true,
  ),
  Product(
    imagepath: 'assets/saleimg2.png',
    title: 'sport dress',
    price: 2000,
    description: "This is sport dress for the girls , blue colored",
    onSale: true,
  ),
];
