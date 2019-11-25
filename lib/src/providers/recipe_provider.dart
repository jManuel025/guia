import 'dart:convert';
import 'package:guiaestudiante/src/models/recipes_model.dart';
import 'package:http/http.dart' as http;

class RecipesProvider{
  final String _url = 'https://guiaest-is.firebaseio.com';

  Future<bool> createRecipe(RecipeModel recipe) async{
    final url = '$_url/recetas.json';
    final resp = await http.post(url, body: recipeModelToJson(recipe));
    final decodedData = json.decode(resp.body);
    print(decodedData);
    return true;
  }
}