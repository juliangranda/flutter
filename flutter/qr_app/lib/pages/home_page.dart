import 'package:flutter/material.dart';
import 'package:qr_app/widgets/custom_navigatorBar.dart';
import 'package:qr_app/widgets/scan_button.dart';

class HomePage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historial'),
        actions: [
          IconButton(
            onPressed: (){},
             icon: Icon(Icons.delete_forever)
             ),
        ],
      ),
      body: Center(
        child: Text('Home page'),
      ),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}