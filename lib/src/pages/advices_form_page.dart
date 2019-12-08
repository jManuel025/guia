import 'package:flutter/material.dart';
import 'package:guiaestudiante/src/models/advices_model.dart';
import 'package:guiaestudiante/src/providers/advice_provider.dart';

class AdvicesFormPage extends StatefulWidget {
  @override
  _AdvicesFormPageState createState() => _AdvicesFormPageState();
}

class _AdvicesFormPageState extends State<AdvicesFormPage> {
  final advicesProvider = new AdvicesProvider();
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  AdviceModel advice = AdviceModel();

  @override
  Widget build(BuildContext context) {

    final AdviceModel adviceData = ModalRoute.of(context).settings.arguments;
    if(adviceData != null){
      advice = adviceData;
    }
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 30.0),
                    width: double.infinity,
                    child: Text('Nuevo consejo', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.blueGrey)),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: _detalle()
                  ),
                  Table(
                    children: [
                      TableRow(
                        children: [
                          _btnCancel(),
                          _btnAccion(),
                        ]
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
  Widget _detalle(){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        initialValue: advice.detalle,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          icon: Icon(Icons.description),
          labelText: 'Describe aqui tu consejo',
          border: OutlineInputBorder()
        ),
        maxLines: 3,
      onSaved: (value) => advice.detalle = value,
      validator: (value){
        if(value.length < 15){
          return 'Es necesaria una descripción mas larga';
        }
        else{
          return null;
        }
      },
      ),
    );
  }
  Widget _btnAccion(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        textColor: Colors.white,
        color: Colors.blueAccent,
        child: Text('Aceptar'),
        onPressed: _submit,
      ),
    );
  }
  Widget _btnCancel(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        textColor: Colors.white,
        color: Colors.blueAccent,
        child: Text('Cancelar'),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
  void _submit(){
    if(formKey.currentState.validate()){
      // Dispara los onsave
      advice.usuario = prefs.email;
      formKey.currentState.save();
      if(advice.id == null){
        advicesProvider.createAdvice(advice);
        showSnackbar("Consejo creado exitosamente");
      }
      else{
        advicesProvider.updateAdvice(advice);
        showSnackbar("Consejo actualizado exitosamente");
      }
      Navigator.pop(context);
    }
  }

  void showSnackbar(String mensaje){
    final snackbar = SnackBar(
      content: Text(mensaje),
      duration: Duration(milliseconds: 1500),
    );
    scaffoldKey.currentState.showSnackBar(snackbar);
  }
}