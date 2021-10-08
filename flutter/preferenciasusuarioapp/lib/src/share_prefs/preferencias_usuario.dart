
//cuando vayamos a usar un preferencias de usuario en otro proyecto basta con dos cosas
//1:copiar el codigo de share_prefs y hacer debidos cambios
//2. no olvidar en el main.dart la configuracion en el void main() para inicializar las prefs en el momento que nosotros las vamos a consumir o utilizar


import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario{

  static final PreferenciasUsuario _instancia = new PreferenciasUsuario._internal();

  factory PreferenciasUsuario(){
    return _instancia;
  }
  PreferenciasUsuario._internal();


  late SharedPreferences _prefs;

  initPrefs()async{
    this._prefs = await SharedPreferences.getInstance();
  }

  //GET y SET del genero
  int get genero{
    return _prefs.getInt('genero') ?? 1;
  }

  set genero(int value){
    _prefs.setInt('genero', value);
  }

    //GET y SET del colorsecundario
  bool get colorSecundario {
    return _prefs.getBool('colorSecundario') ?? false;
  }
 
  set colorSecundario(bool value) {
    _prefs.setBool('colorSecundario', value);
  }

      //GET y SET del nombre usuario
  String get nombreUsuario {
    return _prefs.getString('nombre usuario') ?? '';
  }
 
  set nombreUsuario(String value) {
    _prefs.setString('nombre usuario', value);
  }


        //GET y SET del la ultima pagina
  String get ultimaPagina {
    return _prefs.getString('ultimaPagina') ?? 'home';
  }
 
  set ultimaPagina(String value) {
    _prefs.setString('ultimaPagina', value);
  }


}