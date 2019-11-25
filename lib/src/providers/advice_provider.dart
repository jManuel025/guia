import 'dart:convert';
import 'package:guiaestudiante/src/models/advices_model.dart';
import 'package:http/http.dart' as http;

class AdvicesProvider{
  final String _url = 'https://guiaest-is.firebaseio.com';

  // Create
  Future<bool> createAdvice(AdviceModel advice) async{
    final url = '$_url/consejos.json';
    final resp = await http.post(url, body: adviceModelToJson(advice));
    final decodedData = json.decode(resp.body);
    print(decodedData);
    return true;
  }
  // Read
  Future<List<AdviceModel>> loadAdvices() async{
    final url = '$_url/consejos.json';
    final resp = await http.get(url);
    final Map<String, dynamic> decodedData = json.decode(resp.body);
    final List<AdviceModel> consejos = new List();
    if(decodedData == null) return [];
    decodedData.forEach((id, advice){
      final adviceTemp = AdviceModel.fromJson(advice);
      adviceTemp.id = id;
      consejos.add(adviceTemp);
    });
    print(consejos);
    return consejos;
  }
  // Update
  Future<bool> updateAdvice(AdviceModel advice) async{
    final url = '$_url/consejos/${advice.id}.json';
    final resp = await http.put(url, body: adviceModelToJson(advice));
    final decodedData = json.decode(resp.body);
    print(decodedData);
    return true;
  }
}
