import 'package:flutter/material.dart';
import 'package:peliculas/modals/modals.dart';

class MovieSlider extends StatelessWidget {
  //const name({Key? key}) : super(key: key);

  final List<Movie> movies;
  final String? title;

  const MovieSlider({Key? key, required this.movies, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 260,
      //color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //si no hay titulo no debe de mostrar este widget
          if(this.title != null)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(this.title!, style: TextStyle(fontSize:20, fontWeight: FontWeight.bold)),

              ),
            SizedBox(height:5),
          //se usa un widget llamado expanded para que tenga la listView.builder para que esa list view sepa que tañado debe de tomar al ser el tamaño de la columna flexible por el padding,etc
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: (_ , int index ) => _MoviePoster(movie: movies[index],)          

              ),
          ),
        ],
      )
      
    );
  }
}
//widget privado para mantener el orden y legibilidad en el codigo, ademas de solo ser utilizado en este archivo
class _MoviePoster extends StatelessWidget {
  //const _MoviePoster({Key? key}) : super(key: key);

  final Movie movie;
  const _MoviePoster({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
                  width: 130,
                  height: 190,
                  //color: Colors.green,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [

                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, 'details',arguments: 'movie-instance'),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: FadeInImage(
                            placeholder: AssetImage('assets/no-image.jpg'),
                             image: NetworkImage(movie.fullPosterImg),
                             width: 130,
                             height: 190,
                             fit: BoxFit.cover,
                             ),
                        ),
                      ),

                        SizedBox(height: 5),
                         Text(
                           movie.title,
                           maxLines: 2,
                           overflow: TextOverflow.ellipsis,
                           textAlign: TextAlign.center,
                           ),
                    ],
                  ),
                );
  }
}