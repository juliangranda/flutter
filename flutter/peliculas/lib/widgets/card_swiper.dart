import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:peliculas/modals/modals.dart';

class CardSwiper extends StatelessWidget {
  //const CardSwiper({Key? key}) : super(key: key);

  final List<Movie> movies;
  const CardSwiper({Key? key,required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    if( this.movies.length == 0){
      return Container(
        width: double.infinity,
        height: size.height * 0.5,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Container(
      //toma todo el ancho posible
      width: double.infinity,
      //toma la mitad de la pantalla
      height: size.height * 0.5,
      child: Swiper(
        
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.4,
        itemBuilder: ( BuildContext context, int index){

          final movie = movies[index];
          //print(movie.posterPath);
          //print(movie.fullPosterImg);

          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details', arguments: 'movie-instance'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'), 
                image: NetworkImage(movie.fullPosterImg),//////
                //adaptar la imagen para el tamaño del contenedor
                fit: BoxFit.cover,
              ),
            ),
          );
        },
        )
    );
  }
}