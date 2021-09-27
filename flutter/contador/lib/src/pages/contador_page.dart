

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
1)una clase que crea el estado para sobreescribir el cambio es decir un statefulwidget
2)otra clase que extiende ese widget
3)setstate para redibujar el widget y permita ver el cambio de estado 

*/
class _ContadorPageState extends State<ContadorPage>{

  final _estiloTexto = new TextStyle(fontSize: 30);

//las variables ya se declaran como int, double,string ,etc pq al ser un statefulwidget su estado puede cambiar
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


//este widget o metodolo estamos haciendo para dejar el codigo mas ordenado y legible para que no sea tan dificil de leer
  Widget _crearBotones(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
      SizedBox(width: 30),
      FloatingActionButton(child: Icon(Icons.exposure_zero), onPressed: _reset),
      Expanded(child: SizedBox()),
      FloatingActionButton(child: Icon(Icons.remove), onPressed: _sustraer),
      SizedBox(width: 5.0),
      FloatingActionButton(child: Icon(Icons.add), onPressed: _agregar), 
    ],);
    
    
  }

/*
nota importante:

al momento de añadir la funcion o widget al onPressed del boton no se debe de poner los parentesis() pq no necesitamos que se ejecute una funcion cuando se crea el boton o ejecuta la app
sino que necesitamos que se ejecute la funcion cuando se le da click al boton entonces por esto va sin parentesis el llamado de la funcion o widget
 */
  void _agregar(){
    
    setState(() => _conteo++);
  }


  void _sustraer(){
    setState(() => _conteo--);
  }

  void _reset(){
    setState(() => _conteo=0);
  }
}