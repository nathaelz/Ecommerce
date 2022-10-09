import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sellar_e_commerce/models/product_item.dart';

class BEServices extends ChangeNotifier {
  final _dio = Dio();

  Future<List<ProductItem>> getProducts() async {
    try {
      final resp = await _dio.get(
          "https://boiling-island-39133.herokuapp.com/products",
          options: Options(
              headers: {HttpHeaders.acceptHeader: " application/json"}));

      List<ProductItem> productList = [];

      for (var element in resp.data) {
        final product = ProductItem.fromJson(element);
        productList.add(product);
      }

      return productList;
    } catch (e) {
      throw e;
    }
  }
}
