

import 'package:flutter/material.dart';
import 'package:qr_app/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier{

  List<ScanModel> scans = [];
  String tipoSeleccionado = 'http';

  nuevoScan(String valor)async{

    final nuevoScan = new ScanModel(valor: valor);
    final id = await DBProvider.db.nuevoScan(nuevoScan);

    //asignar el id en la base de datos al modelo
    nuevoScan.id = id;
    if(this.tipoSeleccionado == nuevoScan.tipo){
      this.scans.add(nuevoScan);
      notifyListeners();
    }

  }
      cargarScans()async{
      final scans = await DBProvider.db.getTodosLosScans();
      this.scans = [...scans];
      notifyListeners();
    }

    cargarScansPorTipo(String tipo)async{
      final scans = await DBProvider.db.getScansPorTipo(tipo);
      this.scans = [...scans];
      this.tipoSeleccionado = tipo;
      notifyListeners();
    }

    borrarTodos()async{
      final scans = await DBProvider.db.deleteAllScans();
      this.scans = [];
      notifyListeners();
    }

    borrarScanPorId(int id)async{
      final scans = await DBProvider.db.deleteScan(id);
      this.cargarScansPorTipo(this.tipoSeleccionado);
      
    }
}