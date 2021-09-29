//services - ser proveedor de informacion eso es un provider

import 'dart:convert';

import 'package:flutter/material.dart';
//importamos http
import 'package:http/http.dart' as http;
import 'package:peliculas/modals/modals.dart';
import 'package:peliculas/modals/popular_response.dart';

class MoviesProvider extends ChangeNotifier {
  String _apiKey = '37f698cc72791bec8991273ef0e1d5aa';
  String _baseUrl = 'api.themoviedb.org';
  String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

//para poner a funcionar toda la informacion que estamos recibiendo
  MoviesProvider() {
    print('MoviesProvider inicializando');
    this.getOnDisplayMovies();
    this.getPopularMovies();
  }

  getOnDisplayMovies() async {
    //print('getOnDisplayMovies');

    var url = Uri.https( _baseUrl, '3/movie/now_playing', {
      'api_key': _apiKey,
      'language': _language,
      'page': '1',
    });

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);

    //print(nowPlayingResponse.results[0].title);

    onDisplayMovies = nowPlayingResponse.results;

//le dice a todos los widgets, hey! sucedio un cambio en la data o en tal parte entonces REDIBUJALO!
    notifyListeners();
//ver si esta recibiendo la informacion
    //print(response.body);
  }

  getPopularMovies() async{
        var url = Uri.https( _baseUrl, '3/movie/popular', {
      'api_key': _apiKey,
      'language': _language,
      'page': '1',
    });
    final response = await http.get(url);
    final popularResponse = PopularResponse.fromJson(response.body);
    popularMovies = [...popularMovies , ...popularResponse.results];
    notifyListeners();
  }
  
}
