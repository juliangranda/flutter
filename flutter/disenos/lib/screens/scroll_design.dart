import 'package:flutter/material.dart';

class ScrollScreen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:[

          BackGround(),

          MainContent(),
        ]
      )
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white);
    return SafeArea(
      bottom:false,//no se preocupe poor la parte de abajo solo pon la restriccion en la parte de arriba
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
    
        children: [
          SizedBox(height: 30)
,          Text('11º', style: textStyle,),
          Text('Miercoles', style: textStyle,),
          //expanded
          Expanded(
            child: Container(),
          ),
          Icon(Icons.keyboard_arrow_down, size:100, color: Colors.white,)
        ],
      ),
    );
  }
}

class BackGround extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff30BAD6),
      height: double.infinity,
      alignment: Alignment.topCenter,
      child: Image( image: AssetImage('assets/scroll-1.png'),));
  }
}