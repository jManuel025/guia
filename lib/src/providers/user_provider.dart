import 'dart:convert';

import 'package:http/http.dart' as http;

class UserProvider{

  final String firebaseToken = 'AIzaSyBH70jUe7V4fJpvI1FauyZWvMID9HKx2v4';

  Future newUser(String email, String password) async{
    final authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    final resp = await http.post(
      'https://identitytoolkit.googleapis.com/v1/accounts:signInWithCustomToken?key=$firebaseToken', 
      body: jsonEncode(authData)
    );

    Map<String, dynamic> decodedResp = json.decode(resp.body);
    print(decodedResp);
  }
}