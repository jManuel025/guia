import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:guiaestudiante/src/blocs/validators.dart';

class RegisterBloc with Validators {
  final _usernameController = BehaviorSubject<String>();
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  // final _passwordcController = BehaviorSubject<String>();
  // Recuperar los datos del stream
  Stream<String> get usernameStream => _usernameController.stream;
  Stream<String> get emailStream =>
      _emailController.stream.transform(validarEmail);
  Stream<String> get passwordStream =>
      _passwordController.stream.transform(validarPassword);
  // Stream<String> get passwordcStream => _passwordcController.stream.transform(validarPasswordc);

  // Combinar stream para activar boton
  // este no trabaja con streamcontroller trabaja con behavior subject
  Stream<bool> get formValidStream => Observable.combineLatest3(
      usernameStream, emailStream, passwordStream, (u, e, p) => true);

  // Insertar valores al stream
  Function(String) get changeUsername => _usernameController.sink.add;
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;
  // Function(String) get changePasswordc => _passwordcController.sink.add;

  // obtener ultimo valor ingresado en streams
  String get username => _usernameController.value;
  String get email => _emailController.value;
  String get password => _passwordController.value;

  dispose() {
    _usernameController?.close();
    _emailController?.close();
    _passwordController?.close();
    // _passwordcController?.close();
  }
}

class LoginBloc with Validators {
  // final _usernameController = BehaviorSubject<String>();
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  // Recuperar los datos del stream
  // Stream<String> get usernameStream => _usernameController.stream;
  Stream<String> get emailStream =>
      _emailController.stream.transform(validarEmail);
  Stream<String> get passwordStream => _passwordController.stream;

  // Insertar valores al stream
  // Function(String) get changeUsername => _usernameController.sink.add;
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  Stream<bool> get formValidStream =>
      Observable.combineLatest2(emailStream, passwordStream, (e, p) => true);

  // obtener ultimo valor ingresado en streams
  // String get username => _usernameController.value;
  String get email => _emailController.value;
  String get password => _passwordController.value;

  dispose() {
    // _usernameController?.close();
    _emailController?.close();
    _passwordController?.close();
  }
}
