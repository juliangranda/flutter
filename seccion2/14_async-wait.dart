
//async: devuelve un future

//cuando ejecuta el async lo que pasa es que empieza a ejectuar el codigo y cuando ejecuta algo
//con async lo pasa a un segundo plano hasta terminar el resto del codigo y cuando tenga tiempo
//pues termina de ejecutar lo que esta pendiente o en segundo plano

//await: voy a esperarme hasta que termine de ejecutar la tarea que esta en segundo plano(tarea asincrona)
//para luego seguir con las demas tareas sincronas
void main() async {
  
  print('Antes de la petición');
  
  final data = await httpGet('https://api.nasa.com/aliens');
  
  print( data );
  
//   final nombre = await getNombre( '10' );
//   print( nombre );
//    getNombre( '10' ).then( print );
  
  
  print('Fin del programa');
    
}


Future<String> getNombre( String id ) async {
  return '$id - Fernando';
} 





Future<String> httpGet( String url ) {
  return Future.delayed( 
    Duration( seconds: 3 ), () =>'Hola Mundo - 3 segundos' 
  );
}