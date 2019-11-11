import 'dart:async';

class LoginBloc{
  final _usernameController = StreamController<String>.broadcast();
  final _passwordController = StreamController<String>.broadcast();
  // Recuperar los datos del stream
  Stream<String> get usernameStream => _usernameController.stream;
  Stream<String> get passwordStream => _passwordController.stream;
  // Insertar valores al stream
  Function(String) get changeUsername => _usernameController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  dispose(){
    _usernameController?.close();
    _passwordController?.close();
  }
}