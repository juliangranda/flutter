import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {

//nombrar el ruta de la pagina con un nombre especifico
  static final String routeName = 'settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
      ),
      body: Center(
        child: Text('ajustes page'),
      )
    );
  }
}
