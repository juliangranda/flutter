import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peliculas/modals/modals.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class CastingCards extends StatelessWidget {
  //const CastingCards({Key? key}) : super(key: key);

  final int movieId;

  const CastingCards(this.movieId);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);

    //devuleve un future builder para mostrar los actores de las peliculas
    return FutureBuilder(
      future: moviesProvider.getMovieCast(movieId),
      builder: (BuildContext context, AsyncSnapshot<List<Cast>> snapshot) {

        if(!snapshot.hasData){
          return Container(
            constraints: BoxConstraints(maxWidth: 100),
            height: 180,
            child: CupertinoActivityIndicator(),
          );
        }

//en esta lista siempre vamos a tener un valor
        final cast = snapshot.data!;
        return Container(
          width: double.infinity,
          height: 180,
          //color:Colors.red,
          margin: EdgeInsets.only(bottom: 30),

          child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) => _CastCard()),
        );
      },
    );
  }
}

class _CastCard extends StatelessWidget {
  //const _CastCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 110,
      height: 100,
      //color: Colors.green,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage('https://via.placeholder.com/150x300'),
              height: 140,
              width: 140,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 5),
          Text(
            'actor.name ajajajaja dafafafsa',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
