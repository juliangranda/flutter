void main(){

  //strings
  //nota: una variable se puede declar con var,final o const
  final String nombre = 'tony';
  final apellido = 'stark';
  /*
   * diferencia entre una variable final y constante
   * la constante nunca va a cambiar su valor durante el tiempo de compilacion
   * final solo va a cambiar su valor en la primera asignacion de la variable
   * */
  
  //nombre = 'peter';
  
  /*
   * $ hace referencia a la variable de interes
   * '$variable' se usa para hacer referencia a la variable en forma de Sring
   * */
  print('$nombre $apellido');
  
  //numeros
  int empleados = 10;
  double salario = 1856.25;
  
  print(empleados);
  print(salario);
}