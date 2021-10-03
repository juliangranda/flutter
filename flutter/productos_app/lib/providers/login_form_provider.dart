import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier{

//volver una variable de esta clase  una referencia al formulario, basandonos en la key de el widget de formulario
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  String email = '';
  String password = '';

//validacion del formulario si es correcto o no
  bool isValidForm(){

      //revisamos si el formulario es valido debido a las validaciones ingresadas
      //revisamos que si se esten estableciendo o validando que permanezca el estado de las variables para mantener sus valores
    print(formKey.currentState?.validate() ?? false);
    print('$email - $password');

    return formKey.currentState?.validate() ?? false;
  }
  
}