void main(){

  final nombre = 'Fernando';
  
  //saludar esta tiene argumento posicional
 saludar(nombre);
  
  //saludar2 esta se hace para que no importe la posicion o el orden en el que se ingresa el argumneto en la funcion
  //importante: las {} en el argumento declarado de la funcion es lo que permite que no importe el orden
  saludar2(mensaje: 'hi', nombre: 'julian');
}

//especificar en las funciones el tipo de dato de retorno
/*
void saludar( String nombre){
  print('hola mundo $nombre');
}
*/

//funcion con argumento posicional: este se usa para cuando la funcion es llamada pero no tiene 
//ningun valor de entrada en la funcion cuando se llama desde el main este argumento de entrada esta en [argumento] como default

void saludar( String nombre, [String mensaje = 'no name']){
  print('hola mundo $mensaje $nombre');
}

//required : le esta exigiendo que cuando vaya a usar la funcion si o si tiene que llevar los argumentos de la funcion
//cuando se usan las {} en un parametro de entrada de una funcion es para decir que no importa el orden al ingresar los parametros de la funcion
void saludar2({
  required String nombre,
  required String mensaje,
}){
  
  print('$mensaje $nombre');
}