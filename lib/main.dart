import 'package:flutter/material.dart';
import 'package:guiaestudiante/src/app.dart';
import 'package:guiaestudiante/src/preferencias_usuario/preferencias_usuario.dart';

void main() async {
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();
  runApp(MyApp());
}