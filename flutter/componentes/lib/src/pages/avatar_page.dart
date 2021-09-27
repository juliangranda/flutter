import 'package:flutter/material.dart';
class AvatarPage extends StatelessWidget{
 
  @override 
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://clicasia.com/wp-content/uploads/2018/04/1-1024x1024.jpg'),
              radius: 30.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.brown,
            ),
          ),
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage('https://clicasia.com/wp-content/uploads/2018/04/1-1024x1024.jpg'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
    );
  }
}