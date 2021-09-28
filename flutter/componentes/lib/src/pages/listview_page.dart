import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  //ListaPage({Key? key}) : super(key: key);

  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {

  List<int> _listaNumeros = [1,2,3,4,5];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body: _crearLista(),
    );
  }


  Widget _crearLista(){
    //listviewbuilder se va a encargar de renderizar los elementos cuando sea necesario o es el encargado de redibujar los elementos
    return ListView.builder(
      
      itemCount: _listaNumeros.length,
      //builder:la forma como se va a dibujar este elemento
      itemBuilder: (BuildContext context, int index){

        final imagen = _listaNumeros[index];
        return FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
           image: NetworkImage('https://picsum.photos/500/300/?image=$imagen')
           );
      },

      );
  }
}