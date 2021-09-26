void main(){
  
  //ESTE MAPA  se hace para enviar por medio de un constructor con nombre un mapa como parametro de entrada
  //como si fuera un archivo json recibido por http
  
  final rawJson = {
    'nombre': 'Tony Stark',
    'poder': 'Dinero'
  };

  //nota: los signos de ! estan diciendo al compilador "CONFIA EN MI YO SE LO QUE RECIBO"
  
//   final ironman = new Heroe( nombre: rawJson['nombre']!, poder: rawJson['poder']! );
  
  //esta instanciando o inicializando un constructor que recibe como entrada un MAPA
   final ironman = Heroe.fromJson( rawJson );
  
  print(ironman);
  
//   final wolverine = new Heroe(nombre:'Logan', poder: 'Regeneración');
//   print( wolverine );
  
}


class Heroe {
  
  String nombre;
  String poder;
  
  Heroe({ 
    required this.nombre, 
    required this.poder 
  });
  
  //instanciamos el contructor con nombre de tipo MAPA
  //nombreConstructor.nombreCualquiera(valor de entrada que recibe el contructor<tipoVariable> nombre )
  //alfinal que termina con ":" que se esta instanciando un constructor con nombre
  Heroe.fromJson( Map<String, String> json  ):
    this.nombre = json['nombre']!,                    // ! significa confia en mi se lo que recibo
    this.poder  = json['poder'] ?? 'No tiene poder';  // ?? significa que es la seguridad o valor por defecto
                                                      //en caso de que reciba un valor nulo o "poder" no este en el MAPA que se esta recibiendo del json
  
  
  String toString() {
    return 'Heroe: nombre: ${this.nombre}, poder: ${ this.poder }';
  }
}