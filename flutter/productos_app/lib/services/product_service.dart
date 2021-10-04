//servicio es el que se va a encargar de hacer las peticiones http

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:productos_app/models/models.dart';
import 'package:http/http.dart' as http;

class ProductsService extends ChangeNotifier {
  final String _baseUrl = 'flutter-varios-3b505-default-rtdb.firebaseio.com';
  final List<Product> products = [];

  //propiedad para saber cuando estoy cargando y cuando no
  bool isloading = true;

  ProductsService() {
    this.loadProducts();
  }

//
  Future<List<Product>> loadProducts() async {

    this.isloading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, 'products.json');
    final resp = await http.get(url);

    final Map<String, dynamic> productsMap = json.decode(resp.body);
    //print(productsMap);

    //convertir un mapa a una lista para que nos quede mas facil de utilizar
    productsMap.forEach((key, value) {
      final tempProduct = Product.fromMap(value);
      tempProduct.id = key;
      this.products.add(tempProduct);
    });

    //print(this.products[0].name);
    this.isloading = false;
    notifyListeners();
    return this.products;
;  }
}
