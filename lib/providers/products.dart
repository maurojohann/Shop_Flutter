import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop/data/dummy_data.dart';
import 'package:shop/providers/product.dart';

class Products with ChangeNotifier {
  List<Product> _items = DUMMY_PRODUCTS;

  List<Product> get items => [..._items];

  List<Product> get favoriteItems {
    return _items.where((element) => element.isFavorite).toList();
  }

  Future<void> addProduct(Product newProduct) {
    const url = 'https://shop-flutter-cod3r.firebaseio.com/products';

    return http
        .post(
      url,
      body: json.encode({
        'title': newProduct.title,
        'description': newProduct.description,
        'price': newProduct.price,
        'imageUrl': newProduct.imageUrl,
        'isFavorite': newProduct.isFavorite,
      }),
    )
        .then((response) {
      _items.add(
        Product(
          id: json.decode(response.body)['name'],
          title: newProduct.title,
          price: newProduct.price,
          description: newProduct.description,
          imageUrl: newProduct.imageUrl,
        ),
      );
      notifyListeners();
    });
  }

  int get itemsCount {
    return _items.length;
  }

  void updateProduct(Product product) {
    if (product == null || product.id == null) {
      return;
    }
    final index = _items.indexWhere((prod) => prod.id == product.id);
    if (index >= 0) {
      _items[index] = product;
      notifyListeners();
    }
  }

  void deleteProducts(String id) {
    final index = _items.indexWhere((prod) => prod.id == id);
    if (index >= 0) {
      _items.removeWhere((prod) => prod.id == id);
      notifyListeners();
    }
  }
}

// bool _showFavoriteOnly = false;
// List<Product> get items {
//   if (_showFavoriteOnly) {
//     return _items.where((element) => element.isFavorite).toList();
//   }
//   {
//     return [..._items];
//   }
// }

// void showFavoriteOnly() {
//   _showFavoriteOnly = true;
//   notifyListeners();
// }

// void showAll() {
//   _showFavoriteOnly = false;
//   notifyListeners();
// }
