import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _NavegacionModel(),
      child: Scaffold(
        body: _Paginas(),
        bottomNavigationBar: _Navegacion(),
      ),
    );
  }
}



class _Navegacion extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final navegacionModel = Provider.of<_NavegacionModel>(context);


    return BottomNavigationBar(
      currentIndex: 0,
      onTap: (i) => navegacionModel.paginaActual = i,
      items: [
      BottomNavigationBarItem(icon: Icon(Icons.person_outline),title: Text('para ti')),
      BottomNavigationBarItem(icon: Icon(Icons.public),title: Text('encabezados'))
    ],);
  }
}

class _Paginas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      //physics: BouncingScrollPhysics(),
      physics: NeverScrollableScrollPhysics(),
      children: [
        
        Container(
          color: Colors.red
        ),
        Container(
          color: Colors.green,
        )
      ],
    );
  }
}



class _NavegacionModel with ChangeNotifier {

  int _paginaActual = 0;


  int get paginaActual => this.paginaActual;
  
  set paginaActual( int valor){
    this._paginaActual = valor;
    //avisa a los widgets del valor que se va a cambiar, es decir, que se redibujen todos los widgets
    notifyListeners();
  }
}