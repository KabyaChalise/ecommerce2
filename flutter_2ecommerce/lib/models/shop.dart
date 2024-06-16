import 'package:flutter/material.dart';
import 'package:flutter_2ecommerce/models/product.dart';

class Shop extends ChangeNotifier {
  // product on sale
  final List<Product> _shop = [
    // Product1
    Product(name: "Product 1", price: 214, description: "description1"),
    // Product2
    Product(name: "Product 2", price: 224, description: "description2"),
    // Product3
    Product(name: "Product 3", price: 234, description: "description3"),
    // Product4
    Product(name: "Product 4", price: 244, description: "description4"),
  ];

  // user cart
  List<Product> _cart = [];

  // get product list
  List<Product> get shop => _shop;

  // get user list
  List<Product> get cart => _cart;

  // add item to cart
  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  // remove item from cart
  void removeFromCard(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
