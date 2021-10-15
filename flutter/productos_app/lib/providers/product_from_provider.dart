import 'package:flutter/material.dart';
import 'package:productos_app/models/models.dart';

class ProductFormProvider extends ChangeNotifier{


  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  Product product;

  ProductFormProvider(this.product);

//funcion para hacer el cambio de estado el boton de disponibilidad
  updateAvailability(bool value){
    print(value);
    this.product.available = value;
    notifyListeners();
  }
    
  



  bool isValidForm(){
    print(product.name);
    print(product.price);
    print(product.available);
    return formKey.currentState?.validate() ?? false;
  }
}