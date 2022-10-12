import 'package:flutter/material.dart';
import 'package:sellar_e_commerce/models/product_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppProvider extends ChangeNotifier {
  ProductItem _item = ProductItem();
  ProductItem firstItem = ProductItem();

  List<ProductItem> listItems = [];

  ProductItem get item {
    return _item;
  }

  set item(ProductItem item) {
    notifyListeners();
    _item = item;
  }
}
