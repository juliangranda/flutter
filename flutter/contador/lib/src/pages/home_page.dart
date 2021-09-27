import 'package:flutter/material.dart';


class HomePage extends StatelessWidget{


//nota: las variables van con final pq es un stateleeswidget dado que no tiene un estado y hay que recordar que la palabra final es para
//decir que solo se ejecute la primera vez y sea inmutable como una constante por lo tanto no cambia de estado y por eso debe de ser declarada de esa manera
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