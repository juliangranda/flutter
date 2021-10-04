//servicio es el que se va a encargar de hacer las peticiones http

import 'dart:convert';
import 'dart:io';
//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:productos_app/models/models.dart';
import 'package:http/http.dart' as http;

class ProductsService extends ChangeNotifier {
  final String _baseUrl = 'flutter-varios-3b505-default-rtdb.firebaseio.com';
  final List<Product> products = [];
  late Product selectedProduct;

  //almacenas la imagen
  File? newPictureFile; 

  //late Product? selectedProduct;
  //propiedad para saber cuando estoy cargando y cuando no
  bool isloading = true;
  bool isSaving = false;

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
  }

  Future saveOrCreateProduct(Product product) async {
    isSaving = true;
    notifyListeners();

    if (product.id == null) {
      //es necesario crear
      await this.createProduct( product);
    } else {
      //actualizar
      await this.updateProduct(product);
    }
    isSaving = false;
    notifyListeners();
  }

  Future<String> updateProduct(Product product) async {
    final url = Uri.https(_baseUrl, 'products/${product.id}.json');
    final resp = await http.put(url, body: product.toJson());
    final decodedData = resp.body;

    //print(decodedData);

    //actualizar el listado de productos
    final index = this.products.indexWhere((element) => element.id == product.id);
    this.products[index] = product;

    return product.id!;
  }

    Future<String> createProduct(Product product) async {
    final url = Uri.https(_baseUrl, 'products.json');
    final resp = await http.post(url, body: product.toJson());
    final decodedData = json.decode(resp.body);

    product.id = decodedData['name'];
    print(decodedData);
    this.products.add(product);



    return product.id!;
    
  }

  void updateSelectedProductImage(String path){
    //Crear imagen en la vista previa
    this.selectedProduct.picture = path;
    this.newPictureFile = File.fromUri(Uri(path: path));

    notifyListeners();
  }
}
