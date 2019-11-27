import 'dart:convert';

import 'package:http/http.dart' as http;

class UserProvider{

  final String firebaseToken = 'AIzaSyBH70jUe7V4fJpvI1FauyZWvMID9HKx2v4';


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
    print(decodedResp);
    if(decodedResp.containsKey('idToken')){
      // guardar en storage
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

    Map<String, dynamic> decodedResp = json.decode(resp.body);
    print(decodedResp);
    if(decodedResp.containsKey('idToken')){
      // guardar en storage
    }
    else{ //mostrar error
      return {'ok': false, 'mensaje': decodedResp['error']['message']};
    }
  }
}