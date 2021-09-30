import 'package:flutter/material.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:peliculas/search/search_delegate.dart';
import 'package:peliculas/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  //const DetailsScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
                                      //especifica cual provider
    final moviesProvider = Provider.of<MoviesProvider>(context);
    //print(moviesProvider.onDisplayMovies);
    return Scaffold(
      appBar: AppBar(title: Text('peliculas en cines'), elevation: 0, actions: [
        IconButton(
          icon: Icon(Icons.search_off_outlined),
          onPressed: () => showSearch(context: context, delegate: MovieSearchDelegate()),
        )
      ]),
      //singleChildScrollView lo que hace es permitinos pasarnos el tamaño de la pantalla es parecido a tener una listView por asi decirlo                             
      body: SingleChildScrollView(
        child: Column(
          children: [
            //cardSwiper
            
            CardSwiper( movies: moviesProvider.onDisplayMovies),
            
            //listado horizontal de peliculas
            MovieSlider(
              movies: moviesProvider.popularMovies,
              title: 'Populares', //opcional
              onNextPage: () => moviesProvider.getPopularMovies(),
              ),
            
          ],
        ),
      ),
    );
  }
}
