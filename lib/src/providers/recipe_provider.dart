import 'dart:convert';
import 'package:guiaestudiante/src/models/recipes_model.dart';
import 'package:guiaestudiante/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:http/http.dart' as http;

class RecipesProvider{
  final String _url = 'https://guiaest-is.firebaseio.com';
  final _preferencias = new PreferenciasUsuario();
  
  // Create recipe
  Future<bool> createRecipe(RecipeModel recipe) async{
    final url = '$_url/recetas.json?auth=${_preferencias.token}';
    final resp = await http.post(url, body: recipeModelToJson(recipe));
    final decodedData = json.decode(resp.body);
    print(decodedData);
    return true;
  }
}