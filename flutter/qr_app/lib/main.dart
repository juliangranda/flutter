import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_app/pages/home_page.dart';
import 'package:qr_app/pages/mapa_page.dart';
import 'package:qr_app/providers/scan_list_provider.dart';
import 'package:qr_app/providers/ui_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UiProvider()),
        ChangeNotifierProvider(create: (_) => ScanListProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR reader',
        initialRoute: 'home',
        routes: {
          'home': ( _ ) => HomePage(),
          'map': ( _ ) => MapaPage(),
        },
        theme: ThemeData(
          primaryColor: Colors.deepPurple,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.deepPurple
          )
        ),
      ),
    );
  }
}
