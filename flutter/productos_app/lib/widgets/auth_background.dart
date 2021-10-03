import 'package:flutter/material.dart';
//nota: para una box decoration se extrae el metodo
//para un widget y hacer el codigo mas limpio se usa un extract widget
class AuthBackground extends StatelessWidget {
  
  //esta parte desde widget child hasta override , lo que esta haciendo es un widget con argumentos para poner un widget en el background que va en el centro
  final Widget child;
  const AuthBackground({
    Key? key,
     required this.child
    }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red,
      width: double.infinity,
      height: double.infinity,
      //stack pone widgets unos encima de otros
      child: Stack(
        children: [
          _PurpleBox(),
          
          //safeArea se usa para evitar una zona negra que tienen los celulares
          //se uso click+. y extract widget para poner mas limpio el codigo
          _HeaderIcon(),

          //llamamos widget con argumento
          this.child,

        ],
      ),
    );
  }
}

class _HeaderIcon extends StatelessWidget {
  const _HeaderIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top:30),
        /* height: 200,
        color: Colors.red, */
        child: Icon(Icons.person_pin, color:Colors.white, size: 100,),
      ),
    );
  }
}

class _PurpleBox extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    //hace referencia al mediaquery para ponerle un tamaño del 40% en el height de la pantalla (rsponsive)
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      //box decoration puede crecer con algunas caracteristicas adicionales
      //_purplebackground es un extract decoration pq se esta usando en una boxDecoration
      decoration: _purpleBackground(),
      child: Stack(
        children: [
          //posicion de nuestro widgets
          Positioned(child: _Buubble(), top: 70, left: 130),
          Positioned(child: _Buubble(), top: 0, left: -30),
          Positioned(child: _Buubble(), top: -50, left: -20),
          Positioned(child: _Buubble(), bottom: -50, left: 10),
          Positioned(child: _Buubble(), bottom: 120, left: 250),
        ],
      ),
    );
  }

  //extrack method de _purpleBackground
  BoxDecoration _purpleBackground() => BoxDecoration(
    gradient: LinearGradient(
      colors:[
        Color.fromRGBO(63, 63, 156, 1),
        Color.fromRGBO(90, 70, 178, 1)
      ]
    )
  );
}


class _Buubble extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Container( 
      width: 100,
      height:100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Color.fromRGBO(255, 255, 255, 0.05),
      ),
      
    );
  }
}