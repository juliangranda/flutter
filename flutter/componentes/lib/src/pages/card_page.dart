import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  //const name({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(height: 30.0,),
          _cardTipo2(),
          ],
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue),
            title: Text('soy el tutilo de esta tarjeta'),
            subtitle: Text('aqui esta la tarjeta'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: Text('Cancelar'),
                onPressed: () {},
              ),
              TextButton(
                child: Text('Ok'),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _cardTipo2() {

    return Card(
      child: Column(
        children: <Widget>[

//nota: las imagenes son se pueden importar de una en el archivo toca primero añadirla en la parte de assets del archivo pubspec.yaml
/*
la fadeInimage se usa para cuando hay una demora en la aplicacion para cargar una imagen entonces se ve feo o algo por el estilo,
entonces se usa este para tener una imagen de fondo en caso de que se demore mucho en cargar
*/
          FadeInImage(
            image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/3/35/Neckertal_20150527-6384.jpg'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration( milliseconds: 100),
            height: 300.0,
            fit:BoxFit.cover,
          ),

/*           Image(
            image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/3/35/Neckertal_20150527-6384.jpg'),
            
          ), */

          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('No tengo de que poner')
            ),
        ],
      ),
    );
  }
}
