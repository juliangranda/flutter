import 'package:flutter/material.dart';
import 'package:productos_app/widgets/widgets.dart';
class LoginScreen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground( 
        //singlechildscrollview me va a permitir hacer scroll si los hijos o child sobrepasan la capacidad del dispositivo
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 150),
              CardContainer(
                child: Text('hola mundo'),
              ),
            ],
          ),
        )
      ),
    );
  }
}