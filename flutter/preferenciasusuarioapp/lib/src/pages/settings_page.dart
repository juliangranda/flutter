import 'package:flutter/material.dart';
import 'package:preferenciasusuarioapp/src/share_prefs/preferencias_usuario.dart';
import 'package:preferenciasusuarioapp/src/widgets/menu_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SettingsPage extends StatefulWidget {

//nombrar el ruta de la pagina con un nombre especifico
  static final String routeName = 'settings';

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool _colorSecundario = false;
  int _genero = 1;
  String _nombre = 'Pedro';

  late TextEditingController _textController;

  final prefs = new PreferenciasUsuario();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;
    _textController = new TextEditingController(text: prefs.nombreUsuario);
  }


   _setSelectedRadio(int? valor){

     prefs.genero = valor!;
     _genero = valor;
     setState(() {
       
     });
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
        backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue
      ),
      drawer: MenuWidget(),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text('settings', style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold )),

          ),
          Divider(),
          SwitchListTile(
            value: _colorSecundario, 
            title: Text('color secundario'),
            onChanged: ( value ){
              
              setState(() {
                _colorSecundario = value;
                prefs.colorSecundario = value;
              });
            }
            ),

            RadioListTile(
              value: 1,
              title: Text('masculino'),
               groupValue: _genero,
                onChanged: _setSelectedRadio
                ),

            RadioListTile(
              value: 2,
              title: Text('femenino'),
               groupValue: _genero,
                onChanged: _setSelectedRadio
                ),

            Divider(),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  helperText: 'Nombre de la persona usando el telefono',

                ),
                onChanged: ( value ){
                  prefs.nombreUsuario = value;
                },
              ),
            )
        ],
      )
      
    );
  }
}
