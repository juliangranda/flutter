import 'package:flutter/material.dart';

//descentralizacion u optimizacion del metodo input decoration
//esto lo que va a manejar es metodos y propiedades de manera estatica
class InputDecorations{
  static InputDecoration authInputDecoration({
    //argumentos obligatorios
    required String hintText,
    required String labelText,
    IconData? prefixIcon
  }){
    return InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.deepPurple
                    ),

                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color:Colors.deepPurple,
                    width: 2
                  )
                ),
                //lo que aparece en el textform field visual y al dar click
                hintText: hintText,
                labelText: labelText,
                labelStyle: TextStyle(
                  color: Colors.grey
                ),
                //condicional para ver que muestra
                prefixIcon: prefixIcon != null
                ? Icon(prefixIcon, color: Colors.deepPurple)
                : null
              );
  }
}