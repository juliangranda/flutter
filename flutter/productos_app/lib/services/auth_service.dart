import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
class AuthService extends ChangeNotifier{

  final String _baseUrl = 'identitytoolkit.googleapis.com';
  //token de acceso de API de firebase
  final String _firebaseToken = 'AIzaSyCd-lO5lWhjLA2g8UAGm13xCyIo5p8e6pM';

//Secure storage
  final storage = new FlutterSecureStorage();

  //retornamos algo , es un error sino todo bien
  Future<String?> createUser(String email, String password)async{

    final Map<String, dynamic> authData = {
      'email' : email,
      'password' : password
    };

    final url = Uri.https(_baseUrl, '/v1/accounts:signUp',{
      //key que sigue como argumento que se visualiza en postman
      'key': _firebaseToken
    });

    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodedResp = json.decode(resp.body);
    print(decodedResp);
    if(decodedResp.containsKey('idToken')){
      //token hay que guardarlo en un lugar seguro
      
      await storage.write(key: 'token', value: decodedResp['idToken']);
      //return decodedResp['idToken'];
      return null;
    }else{
      return decodedResp['error']['message'];
    }
  }

  Future<String?> login(String email, String password)async{

    final Map<String, dynamic> authData = {
      'email' : email,
      'password' : password
    };

    final url = Uri.https(_baseUrl, '/v1/accounts:signInWithPassword',{
      //key que sigue como argumento que se visualiza en postman
      'key': _firebaseToken
    });

    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodedResp = json.decode(resp.body);
    print(decodedResp);
    
    if(decodedResp.containsKey('idToken')){
      //token hay que guardarlo en un lugar seguro
      await storage.write(key: 'token', value: decodedResp['idToken']);
      //return decodedResp['idToken'];
      return null;
    }else{
      return decodedResp['error']['message'];
    }
  }

  Future logout() async{

    await storage.delete(key: 'token');
    return;
  }

  Future<String> readToken()async{

    //evaluar si existe el token
    return await storage.read(key: 'token') ?? '';

  }
}