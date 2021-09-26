void main(){


//lista: arreglos o vectores, es una coleccion de elementos que tienen algun tipo de dato en comun
  
  //listas son como vectores siempre empiezan con base en 0
  
  /*
   * las listas se pueden declarar asi: List o List<dynamic>
   * 
   * List solo recibe lo que sea sin importarle la variable
   * 
   * List<dynamic> basicamente es altamente tipada, es decir, dynamic recibe cualquier tipo de variable
   * pero en este caso actua como un generic o para especificar el tipo de variable que debe
   * de recibir la lista en este caso un entero
   * */
  List<int> numeros = [1,2,3,4,5,6,7,8,9];
  numeros.add(11);
  
  //generador de listas
  final masNumeros = List.generate(100, (int index) => index);
  
}