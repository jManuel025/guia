import 'dart:convert';
import 'package:guiaestudiante/src/models/projects_model.dart';
import 'package:guiaestudiante/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:http/http.dart' as http;

class ProjectsProvider{
  final String _url = 'https://guiaest-is.firebaseio.com';
  final _preferencias = new PreferenciasUsuario();
  // Create
  Future<bool> createProject(ProjectModel project) async{
    final url = '$_url/proyectos.json?auth=${_preferencias.token}';
    final resp = await http.post(url, body: projectModelToJson(project));
    final decodedData = json.decode(resp.body);
    print(decodedData);
    return true;
  }
  // Update
  // Read
  // Delete 
}