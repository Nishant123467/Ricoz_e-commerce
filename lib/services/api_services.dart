// lib/services/api_service.dart

import 'dart:convert';
import 'package:e_commerce_ui/models/products.dart';
import 'package:http/http.dart' as http;
// ignore: depend_on_referenced_packages


class ApiService {
  final String apiUrl = "https://dummyjson.com/products";

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      List<dynamic> productsJson = data['products'];
      List<Product> products = productsJson.map((json) => Product.fromJson(json)).toList();
      return products;
    } else {
      throw Exception('Failed to load products');
    }
  }
}
