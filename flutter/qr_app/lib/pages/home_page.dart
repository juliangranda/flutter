import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_app/pages/direcciones_page.dart';
import 'package:qr_app/pages/mapas_page.dart';
import 'package:qr_app/providers/db_provider.dart';
import 'package:qr_app/providers/scan_list_provider.dart';
import 'package:qr_app/providers/ui_provider.dart';
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
            onPressed: (){
              //listen: false pq esta dentro de una funcion y no se puede redibujar
              Provider.of<ScanListProvider>(context, listen: false).borrarTodos();
            },
             icon: Icon(Icons.delete_forever),
             
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
    //obtener el select menu opt atraves del provider
    final uiProvider = Provider.of<UiProvider>(context);

    //necesito devolver un widget de manera condicional para trabajar con TABS
    //cambiar current index para mostrar la pagina respectiva
    final currentIndex = uiProvider.selectedMenuOpt;

    //solo para ver la db temporal
    //final tempScan = new ScanModel(valor: 'http://google.com');
    //DBProvider.db.nuevoScan( tempScan);

    //probamos funciones de la db
    //DBProvider.db.getScanById(1).then((scan)=>print(scan!.valor)); //valor es required por lo que sabemos que recibimos
    //DBProvider.db.getTodosLosScans().then(print);

    //usar el scanListProvider, listen = false pq no me interesa que se redibuje nuestra variable , sino que se redibujen los que estan en el switch
    final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);

    
    switch(currentIndex){
      case 0:
      scanListProvider.cargarScansPorTipo('geo');
        return MapasPage();
      case 1:
      scanListProvider.cargarScansPorTipo('http');
        return DireccionesPage();
      default:
      return MapasPage();
    }
  }
}