

import 'package:flutter/material.dart';

class ContadorPage extends StatefulWidget{

 @override
 createState() => _ContadorPageState();
 
}

/*
nota: vamos a usar "_nombreclase" donde _ significa o le decimos la sistema que lo vamos a obligar a que este _contadorPageState
solo se puede usar en este archivo y no en otro ,es decir, lo estamos volviendo privado

//contadorPage se usa como generic por que si miramos la documentacion del state dice que recibe una T en este caso seria un generic que es el del contador 
 */

/*

nota importante: un statefulwidget necesita de : 
1)una clase que crea el estado para sobreescribir el cambio
2)construir un widget 
3)setstate para redibujar el widget

*/
class _ContadorPageState extends State<ContadorPage>{

  final _estiloTexto = new TextStyle(fontSize: 30);

  int _conteo = 10;

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
            Text('numero de clicks:', style:_estiloTexto),
            Text('$_conteo', style:_estiloTexto),
          ],
        )
      ),
      floatingActionButton: _crearBotones()
     
    );
  }


//este widget lo estamos haciendo para dejar el codigo mas ordenado y legible para que no sea tan dificil de leer
  Widget _crearBotones(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
      SizedBox(width: 30),
      FloatingActionButton(onPressed: () {  }, child: Icon(Icons.exposure_zero)),
      Expanded(child: SizedBox()),
      FloatingActionButton(onPressed: () {  }, child: Icon(Icons.remove)),
      SizedBox(width: 5.0),
      FloatingActionButton(onPressed: () {  }, child: Icon(Icons.add)),
    ],);
    
    
  }
}