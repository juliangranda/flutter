import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  const HomePageTemp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes temp'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('listtile title'),
          ),
          Divider(),
          ListTile(
            title: Text('listtile title'),
          ),
          Divider(),
          ListTile(
            title: Text('listtile title'),
          ),
        ],
      ),
    );
  }
}
