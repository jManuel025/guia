import 'package:flutter/material.dart';

bool isNumber(String valor){
  if(valor.isEmpty) return false;
  final n = num.tryParse(valor);
  return (n == null) ? false: true;
}

void mostrarAlerta(BuildContext context, String mensaje){
  showDialog(
    context: context,
    builder: (context){
      return AlertDialog(
        title: Text('Datos incorrectos'),
        content: Text(mensaje),
        actions: <Widget>[
          FlatButton(
            child: Text('Ok'),
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
      );
    }
  );
}