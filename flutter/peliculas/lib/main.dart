import 'package:flutter/material.dart';
import 'package:peliculas/providers/movies_provider.dart';
//importamos los archivos como si fueran uno solo desde el archivo screens.dart que tiene varias importaciones como archivos de exportados
import 'package:peliculas/screens/screeens.dart';
import 'package:provider/provider.dart';


void main() => runApp(AppState());

class AppState extends StatelessWidget {
  //const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //lazy significa que no hace una instancia o no utiliza el provider hasta que alguna parte de la app  la este utilizando
        ChangeNotifierProvider(create: ( _ ) => MoviesProvider(), lazy: false,)
      ],
      child: MyApp(),
    );
  }
}


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

      },
      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
          color: Colors.indigo,
        )
      ),

    );
  }
}