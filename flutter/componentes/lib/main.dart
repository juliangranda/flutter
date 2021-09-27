import 'package:componentes/src/pages/alert_page.dart';
//import 'package:componentes/src/pages/avatar_page.dart';
//import 'package:componentes/src/pages/home_page.dart';
//import 'package:componentes/src/pages/home_temp.dart';
import 'package:componentes/src/routes/routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes',
      debugShowCheckedModeBanner: false,
      //home: HomePage()
      //definimos las rutas de navegacion
      initialRoute: '/',
      routes: getApplicationRoutes(),

      onGenerateRoute: ( RouteSettings settings ){

        print( ' ruta llamada: ${ settings.name}');
          return MaterialPageRoute(
            builder: (BuildContext context) => AlertPage()
          );
      },

    );
  }
}



