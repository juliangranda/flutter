//services - ser proveedor de informacion eso es un provider

import 'dart:convert';

import 'package:flutter/material.dart';
//importamos http
import 'package:http/http.dart' as http;
import 'package:peliculas/modals/modals.dart';

class MoviesProvider extends ChangeNotifier {
  String _apiKey = '37f698cc72791bec8991273ef0e1d5aa';
  String _baseUrl = 'api.themoviedb.org';
  String _language = 'es-ES';
  MoviesProvider() {
    print('MoviesProvider inicializando');
    this.getOnDisplayMovies();
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
    print(nowPlayingResponse.results[0].title);
    //final Map<String, dynamic> decodeData = json.decode(response.body);
    //print(decodeData['results']);
    //if( response.statusCode != 200) return print('error');

//ver si esta recibiendo la informacion
    //print(response.body);
  }
}
