import 'dart:async';

import 'package:guiaestudiante/src/blocs/validators.dart';

class LoginBloc with Validators{
  final _usernameController = StreamController<String>.broadcast();
  final _passwordController = StreamController<String>.broadcast();
  // final _password = StreamController<String>.broadcast();
  // Recuperar los datos del stream
  Stream<String> get usernameStream => _usernameController.stream;
  Stream<String> get passwordStream => _passwordController.stream.transform(validarPassword);
  // Insertar valores al stream
  Function(String) get changeUsername => _usernameController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  dispose(){
    _usernameController?.close();
    _passwordController?.close();
  }
}