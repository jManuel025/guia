import 'package:flutter/material.dart';
import 'package:guiaestudiante/src/blocs/provider.dart';
import 'package:guiaestudiante/src/models/advices_model.dart';

class AdvicesPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    // esto es hacia el provider
    final advicesbloc = Provider.advicesBloc(context);
    advicesbloc.loadingAdvices();
    
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Color.fromRGBO(26, 49, 99, 39),
        title: Text('Consejos'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 15.0),
        // color: Color.fromRGBO(255, 251, 249, 100),
        child: _listado(advicesbloc),
      ),
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
    if(advice.aprobado){
      return Card(
        elevation: 1.0,
        margin: EdgeInsets.only(top: 7.5, bottom: 7.5, left: 15.0, right: 15.0),
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('"' + advice.detalle + '"', style: TextStyle(color: Color.fromRGBO(26, 49, 99, 39), fontStyle: FontStyle.normal, fontWeight: FontWeight.bold, fontSize: 17), textAlign: TextAlign.center,),
              Divider(endIndent: 35.0, indent: 35.0,),
              Text('Autor: ' + advice.usuario, style: TextStyle(color: Color.fromRGBO(92, 111, 138, 54)), textAlign: TextAlign.left,),
            ],
          ),
        )
      );
    }
    else{
      return Container();
    }
  }
  _btnCrearConsejo(BuildContext context){
    return FloatingActionButton(
      // backgroundColor: Color.fromRGBO(26, 49, 99, 39),
      child: Icon(Icons.add),
      onPressed: () => Navigator.pushNamed(context, 'advices_form'),
    ); 
  }
}