//comando para obtener el SHA1 por seguridad toca poner este comando para que no quede guardado virtual(ejecutar desde la terminal)
//keytool -list -v -keystore "C:\Users\JULIAN DAVID GOMEZ\.android\debug.keystore" -alias androiddebugkey -storepass android -keypass android

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;

  static Future _backgroundHandler(RemoteMessage message) async {
    print('background handler ${message.messageId}');
  }

  static Future _onMessageHandler(RemoteMessage message) async {
    print('onMessage handler ${message.messageId}');
  }

  static Future _onOpenMessageOpenApp(RemoteMessage message) async {
    print('onOpenMessageOpenApp ${message.messageId}');
  }

  static Future initializeApp() async {
    //push notifications
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();
    print('Token: $token');

    //handlers
    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    FirebaseMessaging.onMessage.listen( _onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen( _onOpenMessageOpenApp);

    

    //local notifications
  }
}
