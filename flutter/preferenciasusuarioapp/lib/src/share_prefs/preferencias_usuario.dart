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
  //ninguna de estas propiedad se usa, propiedades que se van a almacenar en esta clase
  //bool _colorSecundario;
  //int _genero;
  //String _nombre;

  //GET y SET del genero
  int get genero{
    return _prefs.getInt('genero') ?? 1;
  }

  set genero(int value){
    _prefs.setInt('genero', value);
  }

}