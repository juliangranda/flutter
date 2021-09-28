import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  //SliderPage({Key? key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100.0;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            _crearSlider(),
            _checkBox(),
            _crearSwitch(),
            //se crea un widget nuevo para que la imagen se expanda en toda la pantalla
            Expanded(child: _crearImagen()),
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'tamaño de la imagen',
      //divisions: 20,
      value: _valorSlider,
      min: 10.0,
      max: 400.0,
      //condicion ternaria,condicional resumido
      onChanged: (_bloquearCheck)
          ? null
          : (valor) {
              //print(valor);
              setState(() {
                _valorSlider = valor;
              });
            },
    );
  }

  Widget _checkBox() {
/*     return Checkbox(
      value: _bloquearCheck, 
      onChanged: ( valor ){

        setState(() {
          _bloquearCheck = valor!;
        });
        
      }
      ); */
    return CheckboxListTile(
        title: Text('bloquear slider'),
        value: _bloquearCheck,
        onChanged: (valor) {
          setState(() {
            _bloquearCheck = valor!;
          });
        });
  }

  Widget _crearSwitch() {
    return SwitchListTile(
        title: Text('bloquear slider'),
        value: _bloquearCheck,
        onChanged: (valor) {
          setState(() {
            _bloquearCheck = valor;
          });
        });
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage(
          'https://i1.wp.com/hipertextual.com/wp-content/uploads/2021/08/batman-scaled.jpeg?fit=2560%2C1440&ssl=1'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }
}
