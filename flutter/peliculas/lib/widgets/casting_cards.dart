import 'package:flutter/material.dart';

class CastingCards extends StatelessWidget {
  //const CastingCards({Key? key}) : super(key: key);

  final int movieId;

  const CastingCards(this.movieId);

  @override
  Widget build(BuildContext context) {
    return Container(

      width:double.infinity,
      height: 180,
      //color:Colors.red,
      margin: EdgeInsets.only(bottom: 30),

      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) => _CastCard()
      ),
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
      height:100,
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

          Text('actor.name ajajajaja dafafafsa',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}