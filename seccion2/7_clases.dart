void main(){
  final wolverine = new Heroe(nombre:'Logan', poder: 'Regeneracion');
  
  //wolverine.nombre = 'logan';
  print(wolverine);

}
//el constructor de la clase tiene el mismo nombre de esta

//nombre de la clase siempre va en mayuscula
class Heroe{
  //caracteristicas de la clase
  String nombre;
  String poder;
  
  //inicializando constructor con argumentos obligatorios para la clase heroe
  Heroe({
    required this.nombre,
    required this.poder
  });
  
  //Heroe(String pNombre){
  //  this.nombre = pNombre;
  //}
  
  //funcion para imprimir informacion sobre la clase
  //importante las {} son importante para poder hacer referencia a la misma clase y no entre en un ciclo infinito
  @override
  String toString(){
    return 'Heroe: nombre: ${this.nombre}, poder: ${this.poder}';
  }
}
