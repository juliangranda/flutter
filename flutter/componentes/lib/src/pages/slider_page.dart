import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  //SliderPage({Key? key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100.0;

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
            //se crea un widget nuevo para que la imagen se expanda en toda la pantalla
            Expanded(
              child: _crearImagen()
              ),
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label:'tamaño de la imagen',
      //divisions: 20,
      value: _valorSlider,
      min: 10.0,
      max: 400.0,
      onChanged: ( valor ){
        //print(valor);
        setState(() {
          _valorSlider = valor;
        });
      },
    );
  }

  Widget _crearImagen(){

    return Image(
      image: NetworkImage('https://i1.wp.com/hipertextual.com/wp-content/uploads/2021/08/batman-scaled.jpeg?fit=2560%2C1440&ssl=1'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }
}