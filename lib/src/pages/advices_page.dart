import 'package:flutter/material.dart';
import 'package:guiaestudiante/src/blocs/provider.dart';
import 'package:guiaestudiante/src/models/advices_model.dart';

class AdvicesPage extends StatelessWidget {
  // final advicesProvider = new AdvicesProvider(); ya no se usa esto si se pone el bloc
  
  @override
  Widget build(BuildContext context) {
    // esto es hacia el provider
    final advicesbloc = Provider.advicesBloc(context);
    advicesbloc.loadingAdvices();
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Consejos'),
        centerTitle: true,
      ),
      body: _listado(advicesbloc),
      floatingActionButton: _btnCrearConsejo(context),
    );
  }
  Widget _listado(AdvicesBloc advicesBloc){ 
    return StreamBuilder(
      stream: advicesBloc.advicesStream,
      builder: (BuildContext context, AsyncSnapshot<List<AdviceModel>> snapshot){
        if(snapshot.hasData){
          final consejos = snapshot.data;
          return ListView.builder(
            itemCount: consejos.length,
            itemBuilder: (context, i) => _elemento(context, consejos[i]),
          );
        }
        else{
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
  Widget _elemento(BuildContext context, AdviceModel advice){
    return ListTile(
      title: Text('${advice.detalle}'),
      subtitle: Text(advice.usuario),
      onTap: () =>  Navigator.pushNamed(context, 'advices_form', arguments: advice),
    );
  }
  _btnCrearConsejo(BuildContext context){
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () => Navigator.pushNamed(context, 'advices_form'),
    ); 
  }
}