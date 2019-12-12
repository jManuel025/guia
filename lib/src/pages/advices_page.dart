import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:guiaestudiante/src/models/advices_model.dart';

class AdvicesPage extends StatefulWidget {
  @override
  _AdvicesPageState createState() => _AdvicesPageState();
}

class _AdvicesPageState extends State<AdvicesPage> {
  
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consejos'),
      ),
      body: Container(
        child: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection('consejos').snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(snapshot.hasError) return Text('${snapshot.error}');
            switch(snapshot.connectionState){
              case ConnectionState.waiting: return Center(child: CircularProgressIndicator());
              default:
                return ListView(
                  children: snapshot.data.documents.map<Widget>(
                    (DocumentSnapshot document){
                      return Container(
                      // height: 125.0,
                      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.5),
                      child: Card(
                        child: Container(
                          padding: EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text( '"'+ document['detalle'] + '"', textAlign: TextAlign.center, style: TextStyle(fontSize: 17.5, fontWeight: FontWeight.w500),),
                                Divider(indent: 60.0, endIndent: 60.0, color: Colors.blueGrey,),
                                Text(document['usuario'], style: TextStyle(color: Colors.grey),)
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                  ).toList(),
                );
            }
          },
        ),
      ),
      floatingActionButton: _btnCrearConsejo(context),
    );
  }

  _btnCrearConsejo(BuildContext context){
    return FloatingActionButton(
      // backgroundColor: Color.fromRGBO(26, 49, 99, 39),
      child: Icon(Icons.add),
      // onPressed: () => Navigator.pushNamed(context, 'advices_form'),
      onPressed: () => _crearConsejo(context),
    ); 
  }

  _crearConsejo(BuildContext context){
    showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          title: Text('Nuevo consejo', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueGrey)),
          content: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                _detalle(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    _boton(false, context),
                    _boton(true, context),
                  ],
                )
              ],
            ),
          ),
        );
      }
    );
  }
  String consejoDetalle = '';
  Widget _detalle(){
    return Container(
      margin: EdgeInsets.only(top: 10.0, bottom: 20.0),
      child: TextFormField(
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          labelText: 'Describe aqui tu consejo',
          border: OutlineInputBorder()
        ),
        maxLines: 2,
        onSaved: (value) => consejoDetalle = value,
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

  Widget _boton(bool crear, BuildContext context){
    return Container(
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        textColor: Colors.white,
        color: Colors.blueAccent,
        child: (crear) ? Text('Aceptar') : Text('Cancelar'),
        onPressed: (crear) ? _submit : () => Navigator.pop(context),
      ),
    );
  }

    void _submit(){
      if(formKey.currentState.validate()){
      formKey.currentState.save();
        Map<String, dynamic> datos = {
          "detalle": consejoDetalle,
          "usuario": prefs.name,
          "usuario_id": prefs.uid
        };
        Firestore.instance.collection('consejos').add(datos);
      }
      Navigator.pop(context);
    }
    
}