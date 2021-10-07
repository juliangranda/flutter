import 'package:flutter/material.dart';
import 'package:qr_app/pages/direcciones_page.dart';
import 'package:qr_app/pages/mapas_page.dart';
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
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}


class _HomePageBody extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {

    //necesito devolver un widget de manera condicional para trabajar con TABS
    //cambiar current index para mostrar la pagina respectiva
    final currentIndex = 1;
    switch(currentIndex){
      case 0:
        return MapasPage();
      case 1:
        return DireccionesPage();
      default:
      return MapasPage();
    }
  }
}