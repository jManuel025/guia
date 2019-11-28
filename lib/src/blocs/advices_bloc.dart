import 'package:guiaestudiante/src/providers/advice_provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:guiaestudiante/src/models/advices_model.dart';

class AdvicesBloc{
  final _advicesController = new BehaviorSubject<List<AdviceModel>>();
  final _loadingControler = new BehaviorSubject<bool>();

  final _advicesProvider = new AdvicesProvider();

  Stream<List<AdviceModel>> get advicesStream => _advicesController.stream;
  Stream<bool> get loading => _loadingControler.stream;

  void loadingAdvices() async{
    final advices = await _advicesProvider.loadAdvices();
    _advicesController.sink.add(advices);
  }

  void createAdvice(AdviceModel advice) async{
    _loadingControler.sink.add(true);
    await _advicesProvider.createAdvice(advice);
    _loadingControler.sink.add(false);
  }

  void updateAdvice(AdviceModel advice) async{
    _loadingControler.sink.add(true);
    await _advicesProvider.updateAdvice(advice);
    _loadingControler.sink.add(false);
  }

  // falta borrar - crear en provider
  // void deleteAdvice(String id) async{
  //   await _advicesProvider.deleteAdvice(id);
  // }

  dispose(){
    _advicesController?.close();
    _loadingControler?.close();
  }
}