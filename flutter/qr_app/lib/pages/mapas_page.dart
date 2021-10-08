import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_app/providers/scan_list_provider.dart';
import 'package:qr_app/widgets/scan_tiles.dart';

class MapasPage extends StatelessWidget {
  //const MapasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
//aqui si toca con el listen:true pq cuando halla un nuevo scan ,es decir , un nuevo codigo QR se debe de redibujar el widget pq debe de aparecer un nuevo dato

//nota o truco: cuando el provider esta despues del widget build(build context context) el listen va en true, pero si
//el provider va por ejemplo en onTap o despues del listview entonces el listen va en false

      return ScanTiles(tipo: 'geo');
  }
}