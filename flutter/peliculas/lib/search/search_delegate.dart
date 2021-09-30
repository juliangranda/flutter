


import 'package:flutter/material.dart';

class MovieSearchDelegate extends SearchDelegate{

  //cambio de idioma de toda la aplicacion
  @override
  // TODO: implement searchFieldLabel
  String get searchFieldLabel => 'Buscar Pelicula';




  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton( 
        icon: Icon(Icons.clear),
        onPressed: ()=>query = ''

      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
       icon: Icon(Icons.arrow_back),
       onPressed: (){
         close(context, null);
       },
       );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('build results');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    
    if(query.isEmpty){
      return Container(
        child: Center(
          child: Icon(Icons.movie_creation_outlined, color: Colors.black38, size: 100, ),
        ),
      );
    }
    return Container();
  }


}





