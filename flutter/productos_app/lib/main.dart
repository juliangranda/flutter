import 'package:flutter/material.dart';
import 'package:productos_app/screens/screens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'productos app',
      initialRoute: 'login',
      routes: {
        'login': (_) => LoginScreen(),
        'home': (_) => HomeScreen(),
      },
      //cambio del color de todos los scafold de la aplicacion
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey[300]
      )
    );
  }
}