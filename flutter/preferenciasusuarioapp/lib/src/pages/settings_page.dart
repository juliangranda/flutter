import 'package:flutter/material.dart';
import 'package:preferenciasusuarioapp/src/widgets/menu_widget.dart';

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _textController = new TextEditingController(text: _nombre);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
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
              });
            }
            ),

            RadioListTile(
              value: 1,
              title: Text('masculino'),
               groupValue: _genero,
                onChanged: ( value ){
                  
                  setState(() {
                    _genero = value as int;
                  });
                }
                ),

            RadioListTile(
              value: 2,
              title: Text('femenino'),
               groupValue: _genero,
                onChanged: ( value ){
                  
                  setState(() {
                    _genero = value as int;
                  });
                }
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
                onChanged: ( value ){},
              ),
            )
        ],
      )
      
    );
  }
}
