import 'dart:convert';
import 'package:guiaestudiante/src/models/projects_model.dart';
import 'package:http/http.dart' as http;

class ProjectsProvider{
  final String _url = 'https://guiaest-is.firebaseio.com';

  Future<bool> createProject(ProjectModel project) async{
    final url = '$_url/proyectos.json';
    final resp = await http.post(url, body: projectModelToJson(project));
    final decodedData = json.decode(resp.body);
    print(decodedData);
    return true;
  }
}