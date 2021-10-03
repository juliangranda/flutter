import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  
  final Widget child;

  const CardContainer({
    Key? key,
     required this.child
     }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    //se envolvio en otro widget llamado padding para darle algo de espacio en los lados
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        //height: 250,
        //color:Colors.red,
        decoration: _createCardShape(),
        //nota: lo que esta haciendo aqui es que desde el widget con padding o container central 
        //va a recibir argumentos desde el login screen para visualizarlos en el container central o widget
        child: this.child,
      ),
    );
  }

  BoxDecoration _createCardShape() => BoxDecoration(

    color: Colors.white,
    borderRadius: BorderRadius.circular(25),
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 15,
        //offset asignacion de la sombra en x o y
        offset: Offset(0,5)
      )
    ]
  );
}