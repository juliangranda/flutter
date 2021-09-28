import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _nombre = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs'),
        
      ),
      body: ListView(
        padding:EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  Widget _crearInput() {

    return TextField(
      //autofocus:automaticamente se posiciona en este campo al ingresar a esta pagina
      //autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),

        //si la variable no llevara el .lenght no haria falta el uso de las {}
        counter: Text('letras ${_nombre.length}'),
        hintText: 'nombre de la persona',
        labelText: 'Nombre',
        helperText: 'solo es el nombre',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle)
      ),

//onchanged:donde se recibe el valor de entrada
      onChanged: (valor){
        setState(() {
          _nombre = valor;
        });
        
        //print(_nombre);
      },
    );
  }

  Widget _crearPersona() {


    return ListTile(
      title: Text('Nombre es: $_nombre'),
    );
  }
}