void main(){

/*
 * mapa o diccionarios: 
 * 
 * nota: recordar en python un diccionario tiene dos cosas: una key y un valor
 * 
 * Map<dynamic, dynamic> persona es como decir Map<key, value> persona
 * */
  
  /*
  Map persona = {
    
    'nombre': 'fernando',
    'edad': 35,
    'soltero': false,
    true: false,
    1: 100,
    2: 500
  };
  
  print(persona['nombre']);
  print(persona[true]);
  print(persona[2]);
  */
  
  //especificando el tipo de dato que debe de manejar el mapa para hacerlo mas tipado
  //Map<dynamic, dynamic>
    Map<String, dynamic> persona = {
    
    'nombre': 'fernando',
    'edad': 35,
    'soltero': false,

  };
  
  persona.addAll({'segundo nombre': 'juan'});
  print(persona);
}