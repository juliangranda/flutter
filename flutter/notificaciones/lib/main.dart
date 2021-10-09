import 'package:flutter/material.dart';
import 'package:notificaciones/screens/home_screen.dart';
import 'package:notificaciones/screens/message_screen.dart';
import 'package:notificaciones/services/push_notifications_service.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationService.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> messengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();
    

    PushNotificationService.messagesStream.listen((message) { 
      //print('my app: $message');
      navigatorKey.currentState?.pushNamed( 'message', arguments: message);
      final snackBar = SnackBar(content: Text('message'));
      messengerKey.currentState?.showSnackBar(snackBar);
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: 'home',
      navigatorKey: navigatorKey,//navegar
      scaffoldMessengerKey: messengerKey,//snacks
      routes: {
        'home': ( _ ) => HomeScreen(),
        'message': ( _ ) => MessageScreen()
      },

    );
  }
}