import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  //const DetailsScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    //cambiar luego por una instancia de movie  (recibir el argumento del slider o swiper)
    final String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';
    return Scaffold(
      body: CustomScrollView(
        //son widgets que tienen cierto comportamiento programado cuando se hace scroll en el container o pantalla o pagina donde se encuentra
        slivers: [
          _CustomAppBar()
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  //const _CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating:false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          child: Text(
            'movie.title',
            style:  TextStyle(fontSize: 16),
            ),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage('https://via.placeholder.com/500x300'),
          fit: BoxFit.cover,
        ),
      ),

    );
  }
}