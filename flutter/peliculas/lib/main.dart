import 'package:flutter/material.dart';
//importamos los archivos como si fueran uno solo desde el archivo screens.dart que tiene varias importaciones como archivos de exportados
import 'package:peliculas/screens/screeens.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peliculas',
      initialRoute: 'home',
      routes:{
        'home':( _ ) => HomeScreen(),
        'details':( _ ) => DetailsScreen(),

      }

    );
  }
}