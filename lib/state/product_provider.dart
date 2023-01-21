import 'package:flutter/material.dart';

class ProductState extends ChangeNotifier {
  final List categories = [
    {
      "title": "Shoe",
      "products": [
        {"brand": "Nike", "price": 2000},
        {"brand": "Rebok", "price": 3000},
        {"brand": "Addidas", "price": 4000},
      ]
    },
    {
      "title": "Electronics",
      "products": [
        {"brand": "TV", "price": 20000},
        {"brand": "Mobile", "price": 30000},
        // {"brand": "PC", "price": 40000},
      ]
    },
    {
      "title": "Cosmetics",
      "products": [
        {"brand": "TV", "price": 20000},
        {"brand": "Mobile", "price": 30000},
        // {"brand": "PC", "price": 40000},
      ]
    },
  ];

  int selectedCategoryIndex = 1;

  void changeIndex(int index) {
    selectedCategoryIndex = index;
    print(index);
    notifyListeners();
  }

  List selectedProducts = [];

  addToCart(pro) {
    selectedProducts.add(pro);
    notifyListeners();
  }

  removeFromCart(pro) {
    selectedProducts.remove(pro);
    notifyListeners();
  }
}
