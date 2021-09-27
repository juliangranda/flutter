import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
class _MenuProvider{

  List<dynamic> opciones = [];

  _MenuProvider(){
    cargarData();
  }

  Future<List<dynamic>> cargarData() async{

    final resp = await rootBundle.loadString('data/menu_opts.json');
    
    
//data hay que convertirlo en un Map pq este viene en forma de string entonces no me sirve para trabajarlo por lo que necesito convertirlo a un Map
      Map dataMap = json.decode(resp);
      print(dataMap['rutas']);
      opciones = dataMap['rutas'];
      return opciones;
    
  }
}


final menuProvider = new _MenuProvider();










