import 'package:flutter/material.dart';
import 'package:food/data/products.dart';
import 'package:food/models/products.dart';

class ProductModel extends ChangeNotifier {
  TextEditingController? searchController;

  void initializeController() {
    searchController = TextEditingController();
    searchResult.clear();
    searchResult.addAll(products);
  }

  List<Product> searchResult = [];

  void filterProducts() {
    final query = searchController?.text.toLowerCase();
    if (query!.isNotEmpty) {
      final searched = products.where((item) {
        return item.name.toLowerCase().contains(query);
      });
      searchResult.clear();
      searchResult.addAll(searched);
    } else {
      searchResult.clear();
      searchResult.addAll(products);
    }
    notifyListeners();
  }
}
