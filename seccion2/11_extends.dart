void main() {
    
  final superman = new Heroe('Clark Kent');
  final luthor   = new Villano('Lex Luthor');
 
  
  print( superman );
  print( luthor );
}


abstract class Personaje {
  String? poder;
  String nombre;
  
  Personaje( this.nombre );
  
  @override
  String toString() {
    return '$nombre - $poder';
  }
  
}

//clase heroe hereda caractericas y funciones la clase padre llamada Personaje
class Heroe extends Personaje {
 
   int valentia = 100;
                                              //":" hacen referencia a que el constructor debe de inicializar al momento de crear la clase
   Heroe( String nombre ): super( nombre );  // super lo que hace es que toma como referencia a "nombre" de la
                                             //clase padre para asignarle el valor desde la clase hijo
  
}

class Villano extends Personaje {
  
  int maldad = 50;
  
  Villano( String nombre ): super( nombre );
}
