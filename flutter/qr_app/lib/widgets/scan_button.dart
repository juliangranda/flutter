import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_app/providers/scan_list_provider.dart';
import 'package:qr_app/utils/utils.dart';
class ScanButton extends StatelessWidget {
  //const ScanButton({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: Icon(Icons.filter_center_focus),
      onPressed: ()async{
        //String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#3d8bef', 'CANCELAR', false, ScanMode.QR);
        //final barcodeScanRes = 'https://www3.animeflv.net/';
        //print(barcodeScanRes);
        
        final barcodeScanRes = 'geo:45.280089,-75.922405';

        if(barcodeScanRes == '-1'){
          return;
        }
        final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);
        final nuevoScan = await scanListProvider.nuevoScan(barcodeScanRes);
        launchURL(context, nuevoScan);

        //inserta valor tipo 'geo' a la bd
        
        //scanListProvider.nuevoScan('geo:6.243687, -75.584647');
        //muestro la base de datos
        //scanListProvider.cargarScans();
      },
      
    );
  }
}