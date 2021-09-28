

import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _nombre = '';
  String _email = '';
  String _fecha = '';

  TextEditingController _inputFieldDateController = new TextEditingController();
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
          _crearEmail(),
          Divider(),
          _password(),
          Divider(),
          _crearFecha(context),
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

  _selectDate(BuildContext context) async{

//aqui se usa un async await pq esta esperando un FUTURE de la funcion showdatepicker

 
    DateTime? picked = await showDatePicker(
      context: context,
       initialDate: new DateTime.now(),
       firstDate: new DateTime(2018),
        lastDate: new DateTime(2025)
        locale: Locale('es', 'ES')
        );

        if(picked != null){
          setState(() {
            _fecha = picked.toString();
            
            //se creo una variable para el controlador que va a modificar el texto y aparte se utilizo la propiedad controller en crear fecha para
            //manejar una relacion entre el calendario y el textfield para intercambiar informacion
            _inputFieldDateController.text = _fecha;

          });
        }
  }

  Widget _crearPersona() {


    return ListTile(
      title: Text('Nombre es: $_nombre'),
      subtitle: Text('Email: $_email'),
    );
  }

  Widget _crearEmail() {
    return TextField(
      //tipo de dato de entrada
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),

        hintText: 'email',
        labelText: 'email',
        helperText: 'solo es el nombre',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email)
      ),

//onchanged:donde se recibe el valor de entrada
      onChanged: (valor){
        setState(() => _email = valor);
        
        //print(_nombre);
      },
    );
  }

  Widget _password() {

    return TextField(
      
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),

        hintText: 'password',
        labelText: 'password',
        
        suffixIcon: Icon(Icons.lock),
        icon: Icon(Icons.lock)
      ),

//onchanged:donde se recibe el valor de entrada
      onChanged: (valor){
        setState(() => _email = valor);
        
        //print(_nombre);
      },
    );
  }

  Widget _crearFecha(BuildContext context) {

    return TextField(
      enableInteractiveSelection: false,

      //controller: relacion entre inputfield y el calendario para mandar datos
      controller:  _inputFieldDateController,

      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),

        hintText: 'fecha nacimiento',
        labelText: 'fecha nacimiento',
        
        suffixIcon: Icon(Icons.perm_contact_cal),
        icon: Icon(Icons.calendar_today)
      ),
      onTap: (){

        FocusScope.of(context).requestFocus(new FocusNode());
        //se le añade el context pq puede que llegue a necesitar crear algo en pantalla dinamicamente y flutter necesita saber en que posicion colocarla
        _selectDate(context);
      },
    );
  }
}