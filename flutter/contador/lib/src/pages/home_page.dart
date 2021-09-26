import 'package:flutter/material.dart';


class HomePage extends StatelessWidget{

  final estiloTexto = new TextStyle(fontSize: 30);

  final conteo = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('titulo'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            Text('numero de clicks:', style:estiloTexto),
            Text('$conteo', style:estiloTexto),
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.add),
        onPressed: () {

          print('hola mundo');
        },
      ),
     
    );
  }

}