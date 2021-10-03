import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:productos_app/ui/input_decorations.dart';
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
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Text(
                    'login',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  SizedBox(height: 30),

                  //Text('formulario')
                  _LoginForm(),
                ],
              ),
            ),
            SizedBox(height: 50),
            Text('crear una nueva cuenta',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 50)
          ],
        ),
      )),
    );
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        //mantener la referencia al key
        //validaciones del form
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              //hace referencia a la clase que va a tener todas las propiedades
              decoration: InputDecorations.authInputDecoration(
                  hintText: 'john.doe@gmail.com',
                  labelText: 'Correo electronico',
                  prefixIcon: Icons.alternate_email_sharp),
              validator: (value) {
                String pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

                RegExp regExp = new RegExp(pattern);
                return regExp.hasMatch(value ?? '')
                    ? null
                    : 'el valor ingresado no luce como un correo';
              },
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              //hace referencia a la clase que va a tener todas las propiedades
              decoration: InputDecorations.authInputDecoration(
                  hintText: '**************',
                  labelText: 'Contraseña',
                  prefixIcon: Icons.lock_clock_outlined),
              validator: (value) {
                
                    
                return (value != null && value.length >= 6 )
                ? null
                : 'la constraseña debe de 6 caracteres';
                

              },
            ),
            SizedBox(height: 30),
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              disabledColor: Colors.grey,
              elevation: 0,
              color: Colors.deepPurple,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                child: Text('ingresar', style: TextStyle(color: Colors.white)),
              ),
              onPressed: () {
                //login form
              },
            )
          ],
        ),
      ),
    );
  }
}
