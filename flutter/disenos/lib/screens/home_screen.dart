import 'package:disenos/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:disenos/widgets/background.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          //background
          Background()
        ],
      ),
    );
  }
}