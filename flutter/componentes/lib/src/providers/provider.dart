import 'package:flutter/services.dart' show rootBundle;
class _MenuProvider{

  List<dynamic> opciones = [];

  _MenuProvider(){
    cargarData();
  }

  cargarData() {

    rootBundle.loadString('data/menu_opts.json')
    //data hay que convertirlo en un Map pq este viene en forma de string entonces no me sirve para trabajarlo por lo que necesito convertirlo a un Map
    .then( (data){

      print(data);
    });
  }
}


final menuProvider = new _MenuProvider();










