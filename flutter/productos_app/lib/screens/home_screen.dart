import 'package:flutter/material.dart';
import 'package:productos_app/widgets/widgets.dart';
class HomeScreen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('productos'),
      ),
      //listview builder ,es mejor pq es mas perezoso ,es decir, solo va a crear los widgets cuando se necesiten en la pantalla y no los va a dejar activos solo cuando es necesario 
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) => GestureDetector(
          onTap: () => Navigator.pushNamed(context, 'product'),
          child: ProductCard())
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){},
        ),
      
    );
  }
}