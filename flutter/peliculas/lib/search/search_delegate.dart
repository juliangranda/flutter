


import 'package:flutter/material.dart';

class MovieSearchDelegate extends SearchDelegate{

  //cambio de idioma de toda la aplicacion
  @override
  // TODO: implement searchFieldLabel
  String get searchFieldLabel => 'Buscar Pelicula';




  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      Text('build actions'),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return Text('build leading');
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('build results');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Text('build suggestions: $query');
  }


}





