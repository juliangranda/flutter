import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  //const AlertPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Mostrar Alerta'),
          //va el context en la funcion pq tenemos que recordar que el primer widget que creamos tiene todo la informacion de lo que estamos usando y es se conoce como el context
          onPressed: () => _mostrarAlert(context),
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
            shape: StadiumBorder(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_location),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  void _mostrarAlert(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            title: Text('Titulo'),
            content: Column(
              //evitar tarjeta se estire demasiado, en este caso mainaxissize dice que se adapte al contenido minimo que halla
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('este es el contenido de la alerta'),
                FlutterLogo(size: 100.0),
              ],
            ),
            actions: <Widget>[
              ElevatedButton(onPressed: () => Navigator.of(context).pop(), child: Text('cancelar')),
              ElevatedButton(onPressed: () {
                Navigator.of(context).pop();
              }, child: Text('ok'))
            ],
          );
        });
  }
}
