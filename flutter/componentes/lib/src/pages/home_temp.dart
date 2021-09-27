import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  //const HomePageTemp({Key? key}) : super(key: key);

  final opciones = ['Uno','Dos','Tres','Cuatro','Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes temp'),
      ),
      body: ListView(
        //children: _crearItems()
        children: _crarItemsCorta()
      ),
    );
  }

  //lista de widget
  List<Widget> _crearItems(){

    List<Widget> lista = <Widget>[];

    for (String opt in opciones) {
      
      final tempWidget = ListTile(
        title: Text( opt ),
      );

//el .. hace referencia a la lista y se usa para que el se puedan añadir metodos mas limpios
      lista..add( tempWidget )
          ..add( Divider() );
      
    }
    return lista;
  }

  List<Widget> _crarItemsCorta(){

      return  opciones.map(( item ){

          return Column(
            children: [
              ListTile(
                title: Text( item + '!'),
                subtitle: Text('Cualquier cosa'),
                leading: Icon( Icons.account_balance_wallet),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: (){},
              ),
              Divider()
            ],
          );
          //se usa el .tolist pq lo que esta entregando en widgets es una LIstTile iterable entonces se debe de convertir a una lista normal
      }).toList();
    
  }
}
