//servicio es el que se va a encargar de hacer las peticiones http


import 'package:flutter/cupertino.dart';
import 'package:productos_app/models/models.dart';

class ProductsService extends ChangeNotifier{


  final String _baseUrl = 'flutter-varios-3b505-default-rtdb.firebaseio.com';
  final List<Product> products = [];


  //hacer fetch de producto
}