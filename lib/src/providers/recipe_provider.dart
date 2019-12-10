import 'dart:convert';
import 'dart:io';
import 'package:mime_type/mime_type.dart';
import 'package:guiaestudiante/src/models/recipes_model.dart';
import 'package:guiaestudiante/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

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

  Future<String> uploadImage(File image) async{
    final url = Uri.parse('https://api.cloudinary.com/v1_1/dyjyvrwrj/image/upload?upload_preset=sqvpftqy');
    final mimeType = mime(image.path).split('/');
    final imageUploadRequest = http.MultipartRequest(
      'POST',
      url
    );

    final file = await http.MultipartFile.fromPath(
      'file', 
      image.path,
      contentType: MediaType(mimeType[0], mimeType[1])
    );

    imageUploadRequest.files.add(file);

    final streamResponse = await imageUploadRequest.send();
    final resp = await http.Response.fromStream(streamResponse);

    if (resp.statusCode != 200 && resp.statusCode != 201) {
      print("Algo malio sal,"); 
      print(resp.body);
      return null;
    }

    final respData = json.decode(resp.body);
    print(respData);
    return respData['secure_url'];
  }
  
  // getRecipes(String catName){
  //   return Firestore.instance
  //     .collection('recetas')
  //     .where('categoria', isEqualTo: catName)
  //     .getDocuments();
  // }
}

// class RecipeService {
//   getRecipes(String catName){
//     return Firestore.instance
//       .collection('recetas')
//       .where('categoria', isEqualTo: catName)
//       .snapshots()
//       .listen((data) => data.documents.forEach((doc) => print(doc["nombre"])));
//   }
// }