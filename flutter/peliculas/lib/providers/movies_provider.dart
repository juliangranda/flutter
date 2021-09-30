//services - ser proveedor de informacion eso es un provider

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
//importamos http
import 'package:http/http.dart' as http;
import 'package:peliculas/helpers/debouncer.dart';
import 'package:peliculas/modals/modals.dart';
import 'package:peliculas/modals/popular_response.dart';
import 'package:peliculas/modals/search_response.dart';

class MoviesProvider extends ChangeNotifier {
  String _apiKey = '37f698cc72791bec8991273ef0e1d5aa';
  String _baseUrl = 'api.themoviedb.org';
  String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];
  int _popularPage = 0;

  final debouncer = Debouncer(
    duration: Duration(milliseconds: 500),
    
    );
  //debouncer o stream
  final StreamController <List<Movie>> _suggestionStreamController = new StreamController.broadcast();
  Stream<List<Movie>> get suggestionStream => this._suggestionStreamController.stream;



//recibe un entero:hace referencia al id de la pelicula, recibe lista:listado de actores
  Map<int, List<Cast>> moviesCast = {};

//para poner a funcionar toda la informacion que estamos recibiendo
  MoviesProvider() {
    print('MoviesProvider inicializando');
    this.getOnDisplayMovies();
    this.getPopularMovies();

    
  }

//optimizacion de codigo                       //cuando pone [] dice que es opcional
  Future<String> _getJsonData(String endpoint, [int page = 1]) async {
    final url = Uri.https(_baseUrl, endpoint, {
      'api_key': _apiKey,
      'language': _language,
      'page': '$page',
    });

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    return response.body;
  }

  getOnDisplayMovies() async {
    //print('getOnDisplayMovies');
    final jsonData = await this._getJsonData('3/movie/now_playing');

    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);

    //print(nowPlayingResponse.results[0].title);

    onDisplayMovies = nowPlayingResponse.results;

//le dice a todos los widgets, hey! sucedio un cambio en la data o en tal parte entonces REDIBUJALO!
    notifyListeners();
//ver si esta recibiendo la informacion
    //print(response.body);
  }

  getPopularMovies() async {
    _popularPage++;
    final jsonData = await this._getJsonData('3/movie/popular', _popularPage);
    final popularResponse = PopularResponse.fromJson(jsonData);
    popularMovies = [...popularMovies, ...popularResponse.results];

    notifyListeners();
  }

  Future<List<Cast>> getMovieCast(int movieId) async {
    //revisar el mapa
    //condicional es para guardar la informacion en el cache para que no este pidiendo a toda hora peticiones http
    if (moviesCast.containsKey(movieId)) return moviesCast[movieId]!;
    print('pidiendo info al servidor - Cast');

    final jsonData = await this._getJsonData('3/movie/$movieId/credits');
    final creditsResponse = CreditsResponse.fromJson(jsonData);

    moviesCast[movieId] = creditsResponse.cast;

    return creditsResponse.cast;
  }

  Future<List<Movie>> searchMovie(String query) async {
    
    final url = Uri.https(_baseUrl, '3/search/movie', {
      'api_key': _apiKey,
      'language': _language,
      'query': query
    });

    final response = await http.get(url);
    final searchResponse = SearchResponse.fromJson(response.body);
    return searchResponse.results;
  }

  void getSuggestionByQuery(String searchTerm) {

    debouncer.value = '';
    debouncer.onValue = (value) async {

      //print('tenemos valor a buscar: $value');
      final results = await this.searchMovie(value);
      this._suggestionStreamController.add(results);
    };

    final timer = Timer.periodic(Duration(milliseconds:200), (_) { 

      debouncer.value = searchTerm;
    });
    
    Future.delayed(Duration(milliseconds:301)).then((_) => timer.cancel());
  }
}
