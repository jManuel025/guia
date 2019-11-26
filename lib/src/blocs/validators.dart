import 'dart:async';

class Validators{

  final validarEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink){
      Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regExp = new RegExp(pattern);
      if(regExp.hasMatch(email)){
        sink.add(email);
      }
      else{
        sink.addError("El correo no es válido");
      }
    }
  );

  final validarPassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink){
      if(password.length >= 6){
        sink.add(password);
      }
      else{
        sink.addError('Debe tener más de 6 caracteres');
      }
    }
  );
  // final validarPasswordc = StreamTransformer<String, String>.fromHandlers(
  //   handleData: (passwordc, sink){
  //     if(passwordc.length >= 6){
  //       sink.add(passwordc);
  //     }
  //     else{
  //       sink.addError('Las contraseñas no coinciden');
  //     }
  //   }
  // );

}