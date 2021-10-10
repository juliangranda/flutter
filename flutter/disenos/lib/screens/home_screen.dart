import 'package:disenos/widgets/background.dart';
import 'package:disenos/widgets/custom_bottom_navigation.dart';
import 'package:disenos/widgets/page_title.dart';
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
          Background(),

          //Homebody
          _HomeBody()
        ],
      ),
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        bottom: false,
        child: Container(
          child: Column(
            children: [
              //titulos
              PageTitle()
        
            ],
          ),
        ),
      ),
    );
  }
}