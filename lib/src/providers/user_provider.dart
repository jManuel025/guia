import 'dart:convert';

import 'package:guiaestudiante/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:http/http.dart' as http;

class UserProvider{

  final String firebaseToken = 'AIzaSyBH70jUe7V4fJpvI1FauyZWvMID9HKx2v4';
  final _preferencias = new PreferenciasUsuario();

  Future<Map<String, dynamic>> login(String email, String password) async{
    final authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    final resp = await http.post(
      'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$firebaseToken', 
      body: jsonEncode(authData)
    );

    Map<String, dynamic> decodedResp = json.decode(resp.body);
    // print(decodedResp);
    if(decodedResp.containsKey('idToken')){
      // guardar en storage
      _preferencias.uid = decodedResp['localId'];
      _preferencias.token = decodedResp['idToken'];
      return {'ok': true, 'token': decodedResp['idToken']};
    }
    else{ //mostrar error
      return {'ok': false, 'mensaje': decodedResp['error']['message']};
    }
  }

  Future newUser(String username, String email, String password) async{
    final authData = {
      'username': username,
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    final resp = await http.post(
      'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$firebaseToken', 
      body: jsonEncode(authData)
    );

    // agregar a bd
    // final String _url = 'https://guiaest-is.firebaseio.com';
    // final url = '$_url/usuarios.json';
    // final newResp = await http.post(url, body: authData);
    // final newDecodedData = json.decode(newResp.body);
    // print(newDecodedData);


    Map<String, dynamic> decodedResp = json.decode(resp.body);
    print(decodedResp);
    if(decodedResp.containsKey('idToken')){
      // guardar en storage
      _preferencias.token = decodedResp['idToken'];
      return {'ok': true, 'token': decodedResp['idToken']};
    }
    else{ //mostrar error
      return {'ok': false, 'mensaje': decodedResp['error']['message']};
    }
  }
}