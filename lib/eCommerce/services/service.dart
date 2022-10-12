import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sellar_e_commerce/eCommerce/services/shared_preferences.dart';
import 'package:sellar_e_commerce/models/product_item.dart';

class BEServices extends ChangeNotifier {
  final _dio = Dio();

  Future<List<ProductItem>> getProducts() async {
    try {
      final resp = await _dio.get(
          "https://boiling-island-39133.herokuapp.com/products",
          options: Options(
              headers: {HttpHeaders.contentTypeHeader: " application/json"}));

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

  Future<bool> createUser(String name, String email, String password,
      String confirmPassword) async {
    try {
      final resp = await _dio
          .post("https://api-user-ecommerce.herokuapp.com/api/usuario",
              options: Options(
                validateStatus: (status) => true,
                headers: {HttpHeaders.contentTypeHeader: " application/json"},
              ),
              data: {
            "nombreCompleto": name,
            "correo": email,
            "clave": password,
            "confirmaClave": password,
          });

      if (resp.data['isOk'] == null || resp.statusCode == 500) {
        return false;
      } else if (resp.data['isOk']) {
        await UserPreferences.saveToken(resp.data['token']);
        print(resp.data['token']);
        return true;
      }
    } catch (e) {
      throw e;
    }
  }

  Future<bool> loginUser(String email, String password) async {
    final resp = await _dio.post(
      'https://api-user-ecommerce.herokuapp.com/api/usuario/login',
      options: Options(
        validateStatus: (_) => true,
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.acceptHeader: "*/*"
        },
      ),
      data: {"correo": email, "clave": password},
    );

    if (resp.data['token'] == null) {
      return false;
    } else if (resp.data['isOk'] == true) {
      await UserPreferences.saveToken(resp.data['token']);
      return true;
    }
  }

  Future<bool> getUserByToken() async {
    final resp = await _dio.post(
      'https://api-user-ecommerce.herokuapp.com/api/usuario/login',
      options: Options(
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.acceptHeader: "*/*"
        },
      ),
    );

    if (resp.data['isOk'] == false) {
      return false;
    } else if (resp.data['isOk'] == true) {
      await UserPreferences.saveToken(resp.data['token']);
      return true;
    }
  }

  Future<ProductItem> getProductosById(String productId) async {
    final resp = await _dio.get(
        "https://boiling-island-39133.herokuapp.com/products/$productId",
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        }));

    final productItem = ProductItem.fromJson(resp.data);

    return productItem;
  }
}
