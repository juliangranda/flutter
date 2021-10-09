import 'package:flutter/material.dart';
import 'package:newsapp/src/models/news_models.dart';
import 'package:newsapp/src/theme/tema.dart';

class ListaNoticias extends StatelessWidget {
  final List<Article> noticias;

  const ListaNoticias(this.noticias);

  @override
  Widget build(BuildContext context) {
    
    

    return ListView.builder(
      itemCount: this.noticias.length,
      itemBuilder: ( _ , int index){
        return _Noticia(noticia: this.noticias[index], index: index);
      }
      );
  }
}

//main front
class _Noticia extends StatelessWidget {
  
  final Article noticia;
  final int index;

  const _Noticia({required this.noticia,required this.index}) ;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TarjetaTopBar( noticia: this.noticia , index: index),

        _TarjetaTitulo(noticia: this.noticia),

        _TarjetaImagen(noticia: this.noticia),

      ],
    );
  }
}




class _TarjetaTopBar extends StatelessWidget {
  final Article noticia;
  final int index;
  const _TarjetaTopBar( {required this.noticia, required this.index}) ;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text('${index + 1}. ' ,style: TextStyle(color: miTema.accentColor),),
          Text('${ noticia.source.name }. ' ),
        ],
      ),
    );
  }
}

class _TarjetaTitulo extends StatelessWidget {
  
  final Article noticia;

  const _TarjetaTitulo({ required this.noticia}) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Text(noticia.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
    );
  }
}


class _TarjetaImagen extends StatelessWidget {
  final Article noticia;

  const _TarjetaImagen({required this.noticia});
  

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('hola mundo'),
      
    );
  }
}