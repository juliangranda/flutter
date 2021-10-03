import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
                    SizedBox(height:10),
                    Text('login', style: Theme.of(context).textTheme.headline4,),
                    SizedBox(height:30),

                    //Text('formulario')
                    _LoginForm(),
                  ],

                ),
              ),

              SizedBox(height: 50 ),
              Text('crear una nueva cuenta', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
            ],
          ),
        )
      ),
    );
  }
}


class _LoginForm extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        //mantener la referencia al key
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
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
                hintText: 'john.doe@gmail.com',
                labelText: 'Correo',
                labelStyle: TextStyle(
                  color: Colors.grey
                ),
                prefixIcon: Icon(Icons.alternate_email_sharp, color: Colors.deepPurple)
              ),
            )
          ],
        ),
      ),
    );
  }
}