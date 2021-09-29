import 'package:flutter/material.dart';
import 'package:peliculas/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  //const DetailsScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('peliculas en cines'),
        elevation: 0,
        actions: [
          IconButton(
            
             icon: Icon(Icons.search_off_outlined),
             onPressed: (){},
             )
        ]
      ),
      body: Column(
        children: [

          //cardSwiper
          CardSwiper(),

          //listado horizontal de peliculas

        ],
      ),
    );
  }
}