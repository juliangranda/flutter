import 'package:flutter/material.dart';


/*

nota importantisima: 


TODO ES LO SACO DE : https://app.quicktype.io/

como lo hizo : desde el postman se copio todo el archivo json que tiene la informacion de la url movies que salio de : https://www.themoviedb.org/documentation/api
y se pego en quicktype para que nos generara la clase del archivo json de postman en dart ,mejor dicho nos ahorro un monton de trabajo,

recordar: durante la generacion de dicho codigo:
-ponerle nombre a la clase
-selecciona el tipo de datos json

mano_derecha/resultado
-escoger lenguaje dart
-click en put enconder y decoder class
-click en use method names fromMap....
copie y pegue el resto del codigo y no se ponga nervioso por tanto error




*/
// To parse this JSON data, do
//
//     final nowPlayingResponse = nowPlayingResponseFromMap(jsonString);

//DAO
import 'dart:convert';

import 'package:peliculas/modals/movie.dart';



class NowPlayingResponse {
  //constructor 
    NowPlayingResponse({
        required this.dates,
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

//instancias o propiedades
    Dates dates;
    int page;
    List<Movie> results;
    int totalPages;
    int totalResults;

    factory NowPlayingResponse.fromJson(String str) => NowPlayingResponse.fromMap(json.decode(str));

    factory NowPlayingResponse.fromMap(Map<String, dynamic> json) => NowPlayingResponse(
        dates: Dates.fromMap(json["dates"]),
        page: json["page"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );


}

class Dates {
    Dates({
        required this.maximum,
        required this.minimum,
    });

    DateTime maximum;
    DateTime minimum;

    factory Dates.fromJson(String str) => Dates.fromMap(json.decode(str));

    factory Dates.fromMap(Map<String, dynamic> json) => Dates(
        maximum: DateTime.parse(json["maximum"]),
        minimum: DateTime.parse(json["minimum"]),
    );

}

