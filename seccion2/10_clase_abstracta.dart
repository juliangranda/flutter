//clase abstracta: es una clase que no se puede instanciar

//la clase abstracta nos sirve para simplemente obligar a otras clases a que implementen o que puedan aceptar
//las caracteristica de esta clase

//nota: esto es parecido al contrato entre una interfaz y una clase en java
/*
 * nota:
 * interfaz: es el contrato donde solo se inicializan todas las funciones de un producto pero no lleva nada de codigo
 * las clases:son las encargadas de implementar todo el codigo de la funcion inicializada en la interfaz
 * 
 * ej: un carro-- la interfaz lleva prender,apagar,frenar,derecha,etc y las clases llevan todo el demas proceso interno a implementar ,codigo
 * */
void main() {
  
  final perro = new Perro();
  final gato = new Gato();
  
  perro.emitirSonido();
  
  sonidoAnimal(perro);
  sonidoAnimal( gato );
}

void sonidoAnimal(Animal animal){
  animal.emitirSonido();
}
//clase abstracta //como un contrato
//tiene todas las variable y funciones que deben tener las demas que la implementan
abstract class Animal{
  int? patas;
  void emitirSonido(); //emitir sonido debe de estar en las clases que implementan la clase abstracta
}

//clase que implementa la clase abstracta tiene las funcionalidad de la funcion inicializada // cliente
class Perro implements Animal{
  
  int? patas;
  
  void emitirSonido() => print('guagua');
}


class Gato implements Animal {
  
  int? patas;
  int? cola;
  
  void emitirSonido() => print('Miauuuuuuuu');
}
