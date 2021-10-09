//encargado de hacer peticiones http

import 'package:flutter/material.dart';
import 'package:newsapp/src/models/news_models.dart';
import 'package:http/http.dart' as http;

final _URL_NEWS = 'https://newsapi.org/v2';
final _APIKEY = 'a76e3a6f008e4098bc5cee40a81c8524';
class NewsService with ChangeNotifier{

  List<Article> headlines = [];

  NewsService(){

    this.getTopHeadLines();

  }

  getTopHeadLines()async{
    
      final url = Uri.parse('$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=ca');
      final resp = await http.get(url);

      final newsResponse = newsResponseFromJson( resp.body );
      

      //llamo todos los articulos con metodo http
      this.headlines.addAll(newsResponse.articles);
      notifyListeners();

  }
}