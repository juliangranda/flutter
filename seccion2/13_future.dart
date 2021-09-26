//future: es nada mas que una tarea asincrona, es algo que se va a ejectuar a diferente tiempo
        //tarea asincrona que se hace a destiempo, se hace  a un hilo diferente a nuestra aplicacion
       //el resto del codigo se sigue ejecutando mientras una parte del codigo se va resolviendo como una peticion de datos  o 
        //hacer alguna otra actividad distinta

//en JS se le conoce al FUTURE como Promesas
void main() {
  
  print('Antes de la petición');
  
  httpGet('https://api.nasa.com/aliens')
     .then( (data) {
       
       print( data.toUpperCase() );
       
     });
  
  
  print('Fin del programa');
    
}




Future<String> httpGet( String url ) {
  return Future.delayed( 
    Duration( seconds: 3 ), () =>'Hola Mundo - 3 segundos' 
  );
}