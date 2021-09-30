import 'package:flutter/material.dart';
import 'package:peliculas/modals/modals.dart';
import 'package:peliculas/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  //const DetailsScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    //cambiar luego por una instancia de movie  (recibir el argumento del slider o swiper)
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;
    //print(movie.title);
    return Scaffold(
      body: CustomScrollView(
        //son widgets que tienen cierto comportamiento programado cuando se hace scroll en el container o pantalla o pagina donde se encuentra
        slivers: [
          _CustomAppBar(movie),
          //slivers no aceptan widget de texto u otros por lo que toca usar sliverChildListDelegate para que nos genere una lista de widgets
          SliverList(
            delegate: SliverChildListDelegate([
              _PosterAndTitle(movie),
              _Overview(movie),
              _Overview(movie),
              _Overview(movie),
              CastingCards(movie.id),


            ]),
            )
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  //const _CustomAppBar({Key? key}) : super(key: key);

  final Movie movie;
  const _CustomAppBar(this.movie);

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
          padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
          color: Colors.black12,
          child: Text(
            movie.title,
            style:  TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
            ),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage(movie.fullBackdropPath),
          fit: BoxFit.cover,
        ),
      ),

    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  final Movie movie;
  const _PosterAndTitle(this.movie);


  
  //const _PosterAndTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;


    return Container(
      margin: EdgeInsets.only(top:20),
      padding: EdgeInsets.symmetric(horizontal:20),
      child: Row(
        children: [
          Hero(
            tag: movie.id,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                height: 150,
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage(movie.fullPosterImg)),
                
                 
            ),
          ),
          SizedBox(width: 20),

          Expanded(
            child: Column(
              
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                Text(movie.title,style: textTheme.headline5, overflow: TextOverflow.ellipsis, maxLines: 2 ),
                Text(movie.originalTitle,style: textTheme.subtitle1, overflow: TextOverflow.ellipsis, maxLines: 2 ),
          
                Row(
                  children: [
                    Icon(Icons.star_outline, size:15, color: Colors.grey),
                    SizedBox(width: 5),
                    Text('${movie.voteAverage}', style: textTheme.caption)
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  //const _Overview({Key? key}) : super(key: key);
  final Movie movie;
  const _Overview(this.movie);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(movie.overview,
      textAlign: TextAlign.justify,
      style: Theme.of(context).textTheme.subtitle1),

    );
  }
}