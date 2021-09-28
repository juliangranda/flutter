import 'dart:async';
 
import 'package:flutter/material.dart';
 
class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}
 
class _ListaPageState extends State<ListaPage> {
  ScrollController _scrollController = new ScrollController();
  List<int> _listaNumeros = [];
  int _ultimoItem = 0;
  bool _isloading = false;
  @override
  void initState() {
    super.initState();
    _agregar10();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _fetchData();
      }
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView Page"),
        backgroundColor: Colors.blueGrey[800],
      ),
      body: Stack(
        children: [_crearLista(), _crearLoading()],
      ),
    );
  }
 
  Widget _crearLista() {
    return ListView.builder(
      controller: _scrollController,
      itemCount: _listaNumeros.length,
      itemBuilder: (BuildContext context, int index) {
        final imagen = _listaNumeros[index];
        return FadeInImage(
            image: NetworkImage("https://picsum.photos/seed/$imagen/500/400"),
            placeholder: AssetImage("assets/jar-loading.gif"));
      },
    );
  }
 
  void _agregar10() {
    for (var i = 1; i < 5; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
      setState(() {});
    }
  }
 
  Future _fetchData() async {
    _isloading = true;
    setState(() {});
    final _duracion = new Duration(seconds: 5);
    return new Timer(_duracion, respuestaHTTP);
  }
 
  void respuestaHTTP() {
    _isloading = false;
    _scrollController.animateTo(_scrollController.position.pixels + 100,
        curve: Curves.fastOutSlowIn, duration: Duration(milliseconds: 250));
    _agregar10();
  }
 
  Widget _crearLoading() {
    if (_isloading == true) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [CircularProgressIndicator()],
          ),
          SizedBox(
            height: 15.0,
          ),
        ],
      );
    } else {
      return Container();
    }
  }
 
  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }
}