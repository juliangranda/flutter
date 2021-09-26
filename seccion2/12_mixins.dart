//mixins: no es mas que nosotros tengamos alguna clase y le añadamos caracteristicas que ya 
//estan totalmente implementadas a nuestra clase

//Mixins are a way of reusing a class’s code in multiple class hierarchies.

//tambien se puede entender que una clase de otra jerarquia puede mezclarse con 
//las caracteristicas o funcionales especificas de otras,
//por ejemplo el murcielago hereda de mamiferos pero este mezcla dos caracteristicas especificas
//de la clase volador y caminante

//https://medium.com/flutter-community/dart-what-are-mixins-3a72344011f3
//super clase
abstract class Animal { }

//tres subclases
abstract class Mamifero extends Animal { }
abstract class Ave extends Animal { }
abstract class Pez extends Animal { }


//3 clases concretas o especificas
abstract class Volador {
  void volar() => print('estoy volando');
}

abstract class Caminante {
  void caminar() => print('estoy caminando');
}

abstract class Nadador {
  void nadar() => print('estoy nadando');
}


//"with" hace referencia a los mixins
class Delfin extends Mamifero with Nadador{}

class Murcielago extends Mamifero with Caminante, Volador {}

class Gato extends Mamifero with Caminante {}

class Paloma extends Ave with Caminante, Volador {}

class Pato extends Ave with Caminante, Volador, Nadador {}

class Tiburon extends Pez with Nadador {}

class PezVolador extends Pez with Nadador, Volador {}


void main() {
  
  
//   final flipper = new Delfin();
//   flipper.nadar();
  
//   final batman = new Murcielago();
//   batman.caminar();
//   batman.volar();

}