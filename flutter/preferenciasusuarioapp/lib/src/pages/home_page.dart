import 'package:flutter/material.dart';
import 'package:preferenciasusuarioapp/src/pages/settings_page.dart';
import 'package:preferenciasusuarioapp/src/share_prefs/preferencias_usuario.dart';
import 'package:preferenciasusuarioapp/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
//nombrar el ruta de la pagina con un nombre especifico
  static final String routeName = 'home';
  final prefs = new PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
      appBar: AppBar(
        title: Text('preferencias de usuario'),
        backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Color secundario: ${prefs.colorSecundario}'),
          Divider(),
          Text('Genero: ${prefs.genero}'),
          Divider(),
          Text('Nombre Usuario: ${prefs.nombreUsuario}'),
          Divider(),
        ],
      ),
    );
  }


}
