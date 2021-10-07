
//----     /data/user/0/com.example.qr_app/app_flutter/ScansDB.db

//proveedor de informacion de la db, provider y service es lo mismo
import 'dart:io';

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:path_provider/path_provider.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:qr_app/models/scan_model.dart';
export 'package:qr_app/models/scan_model.dart';

class DBProvider{

//estructura del servidor
  static Database? _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();

//pregunta si tengo algo o si ya tengo la base de datos instanciada
  Future<Database>get database async{
    if(_database != null) return _database!;

    _database = await initDB();

    return _database!;
  }
//
   Future<Database> initDB() async{
     //path de donde almacenaremos la base de datos
     Directory documentsDirectory = await getApplicationDocumentsDirectory();
     final path = join( documentsDirectory.path, 'ScansDB.db' );
     print(path);

     //crear base de datos
     return await openDatabase(
       path,
       //aumentar el nivel de la version cada que hacemos cambios en el base de datos como añadir o eliminar tablas etc
       version: 1,
       onOpen: (db){},
       onCreate: (Database db, int version)async{

         await db.execute('''
          CREATE TABLE Scans(
            Id INTEGER PRIMARY KEY,
            tipo TEXT,
            valor TEXT
          )
         ''');
       }
     );
  }

    Future<int> nuevoScanRaw( ScanModel nuevoScan)async{

      final id = nuevoScan.id;
      final tipo = nuevoScan.tipo;
      final valor = nuevoScan.valor;

      //verificar la base de datos
      final db = await database;
      final res = await db.rawInsert('''
        INSERT INTO Scans( id, tipo, valor)
          VALUES( $id, '$tipo', '$valor')
      ''');

      return res;
    }

  Future<int>nuevoScan(ScanModel nuevoScan)async{
    final db = await database;
    final res = await db.insert('Scans', nuevoScan.toJson());
    //es el id del ultimo registro insertado
    //print(res);
    return res;
  }


}