import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
  //const name({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 260,
      //color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text('populares', style: TextStyle(fontSize:20, fontWeight: FontWeight.bold)),

            ),
            SizedBox(height:5),
          //se usa un widget llamado expanded para que tenga la listView.builder para que esa list view sepa que tañado debe de tomar al ser el tamaño de la columna flexible por el padding,etc
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              itemBuilder: (_ , int index ) => _MoviePoster()          

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
                             image: NetworkImage('https://via.placeholder.com/300x400'),
                             width: 130,
                             height: 190,
                             fit: BoxFit.cover,
                             ),
                        ),
                      ),

                        SizedBox(height: 5),
                         Text(
                           'star wars: el retorno del el nuevo jedi silvestre de Monte cristo',
                           maxLines: 2,
                           overflow: TextOverflow.ellipsis,
                           textAlign: TextAlign.center,
                           ),
                    ],
                  ),
                );
  }
}