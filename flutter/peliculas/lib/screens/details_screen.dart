import 'package:flutter/material.dart';
import 'package:peliculas/widgets/widgets.dart';

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
          _CustomAppBar(),
          //slivers no aceptan widget de texto u otros por lo que toca usar sliverChildListDelegate para que nos genere una lista de widgets
          SliverList(
            delegate: SliverChildListDelegate([
              _PosterAndTitle(),
              _Overview(),
              _Overview(),
              _Overview(),
              CastingCards(),


            ]),
            )
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
          padding: EdgeInsets.only(bottom: 5),
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

class _PosterAndTitle extends StatelessWidget {

  //const _PosterAndTitle({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;


    return Container(
      margin: EdgeInsets.only(top:20),
      padding: EdgeInsets.symmetric(horizontal:20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              height: 150,
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage('https://via.placeholder.com/200x300')),
              
               
          ),
          SizedBox(width: 20),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Text('movie.title',style: textTheme.headline5, overflow: TextOverflow.ellipsis, maxLines: 2 ),
              Text('movie.originalTitle',style: textTheme.subtitle1, overflow: TextOverflow.ellipsis, maxLines: 1 ),

              Row(
                children: [
                  Icon(Icons.star_outline, size:15, color: Colors.grey),
                  SizedBox(width: 5),
                  Text('movie.voteAverage', style: textTheme.caption)
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  //const _Overview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text('Commodo aute ipsum dolor nisi consequat velit elit proident sint irure veniam. Adipisicing dolore exercitation nostrud ex proident aliquip sint nulla nisi labore commodo consectetur. Laboris consequat duis nostrud consectetur nisi.',
      textAlign: TextAlign.justify,
      style: Theme.of(context).textTheme.subtitle1),

    );
  }
}