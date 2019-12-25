import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:guiaestudiante/src/models/advices_model.dart';
import 'package:guiaestudiante/src/utils/utils.dart';

class UpdtProfiePage extends StatefulWidget {
  @override
  _UpdtProfiePageState createState() => _UpdtProfiePageState();
}

class _UpdtProfiePageState extends State<UpdtProfiePage> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    dynamic usuario = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar perfil'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(30.0),
            child: Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  _universidad(usuario),
                  _carrera(usuario),
                  _expediente(usuario),
                  Divider(height: 0.0,),
                  _habilidades(usuario),
                  Divider(height: 0.0,),
                  _intereses(usuario),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      _btn('Cancelar', usuario),
                      _btn('Aceptar', usuario),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String universidad;
  String carrera;
  String expediente;
  Widget _universidad(DocumentSnapshot usuario){
    return Container(
      padding: EdgeInsets.only(bottom: 20.0, top: 10.0),
      child: TextFormField(
        initialValue: usuario['universidad'],
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration(
          icon: Icon(Icons.school),
          labelText: 'Universidad',
        ),
        onSaved: (value) => universidad = value,
      ),
    );
  }
  Widget _carrera(DocumentSnapshot usuario){
    return Container(
      padding: EdgeInsets.only(bottom: 20.0, top: 10.0),
      child: TextFormField(
        textCapitalization: TextCapitalization.words,
        initialValue: usuario['carrera'],
        decoration: InputDecoration(
          icon: Icon(Icons.school),
          labelText: 'Carrera',
        ),
        onSaved: (value) => carrera = value,
      ),
    );
  }
  Widget _expediente(DocumentSnapshot usuario){
    return Container(
      padding: EdgeInsets.only(bottom: 20.0, top: 10.0),
      child: TextFormField(
        keyboardType: TextInputType.number,
        maxLength: 6,
        initialValue: usuario['expediente'],
        decoration: InputDecoration(
          icon: Icon(Icons.school),
          labelText: 'Expediente'
        ),
        onSaved: (value) => expediente = value,
        validator: (value){
          if(!isNumber(value)){
            return 'El expediente sólo contiene números';
          }
          else{
            return null;
          }
        },
      ),
    );
  }
  Widget _habilidades(DocumentSnapshot usuario){
    return Container(
      padding: EdgeInsets.only(bottom: 20.0, top: 10.0),
      child: Column(
        children: <Widget>[
          Container(
            // padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  width: double.infinity,
                  child: Text('Selecciona tus habilidades', style: TextStyle(fontSize: 15.0)),
                ),
              ],
            )
          ),
          Wrap(
            spacing: 10.0,
            runSpacing: 2.0,
            children: <Widget>[
              FilterChip(
                label: Text('Comunicación'),
                labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Color.fromRGBO(24, 128, 192, 1.0)),
                selected: usuario['habilidades']['Comunicacion'],
                backgroundColor: Color.fromRGBO(24, 128, 192, .30),
                onSelected: (valor){
                  setState(() {
                    usuario['habilidades']['Comunicacion'] = valor;
                  });
                },
                selectedColor: Color.fromRGBO(24, 128, 192, .30),
              ),
              FilterChip(
                label: Text('Creatividad'),
                labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Color.fromRGBO(24, 128, 192, 1.0)),
                selected: usuario['habilidades']['Creatividad'],
                backgroundColor: Color.fromRGBO(24, 128, 192, .30),
                onSelected: (valor){
                  setState(() {
                    usuario['habilidades']['Creatividad'] = valor;
                  });
                },
                selectedColor: Color.fromRGBO(24, 128, 192, .30),
              ),
              FilterChip(
                label: Text('Escucha'),
                labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Color.fromRGBO(24, 128, 192, 1.0)),
                selected: usuario['habilidades']['Escucha'],
                backgroundColor: Color.fromRGBO(24, 128, 192, .30),
                onSelected: (valor){
                  setState(() {
                    usuario['habilidades']['Escucha'] = valor;
                  });
                },
                selectedColor: Color.fromRGBO(24, 128, 192, .30),
              ),
              FilterChip(
                label: Text('Liderazgo'),
                labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Color.fromRGBO(24, 128, 192, 1.0)),
                selected: usuario['habilidades']['Liderazgo'],
                backgroundColor: Color.fromRGBO(24, 128, 192, .30),
                onSelected: (valor){
                  setState(() {
                    usuario['habilidades']['Liderazgo'] = valor;
                  });
                },
                selectedColor: Color.fromRGBO(24, 128, 192, .30),
              ),
              FilterChip(
                label: Text('Razonamiento'),
                labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Color.fromRGBO(24, 128, 192, 1.0)),
                selected: usuario['habilidades']['Razonamiento'],
                backgroundColor: Color.fromRGBO(24, 128, 192, .30),
                onSelected: (valor){
                  setState(() {
                    usuario['habilidades']['Razonamiento'] = valor;
                  });
                },
                selectedColor: Color.fromRGBO(24, 128, 192, .30),
              ),
            ],
          ),
        ],
      )
    );
  }
  Widget _intereses(DocumentSnapshot usuario){
  dynamic intereses = usuario['intereses'];
    return Container(
      // padding: EdgeInsets.only(bottom: 20.0, top: 10.0),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  child: Text('Selecciona tus intereses', style: TextStyle(fontSize: 15.0)),
                ),
              ],
            )
          ),
          Wrap(
            spacing: 10.0,
            runSpacing: 2.0,
            children: <Widget>[
              FilterChip(
                label: Text('Arte'),
                labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Color.fromRGBO(24, 128, 192, 1.0)),
                selected: intereses['Arte'],
                backgroundColor: Color.fromRGBO(24, 128, 192, .30),
                onSelected: (valor){
                  setState(() {
                    intereses['Arte'] = valor;
                  });
                },
                selectedColor: Color.fromRGBO(24, 128, 192, .30),
              ),
              FilterChip(
                label: Text('Ciencia'),
                labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Color.fromRGBO(24, 128, 192, 1.0)),
                selected: intereses['Ciencia'],
                backgroundColor: Color.fromRGBO(24, 128, 192, .30),
                onSelected: (valor){
                  setState(() {
                    intereses['Ciencia'] = valor;
                  });
                },
                selectedColor: Color.fromRGBO(24, 128, 192, .30),
              ),
              FilterChip(
                label: Text('Deportes'),
                labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Color.fromRGBO(24, 128, 192, 1.0)),
                selected: intereses['Deportes'],
                backgroundColor: Color.fromRGBO(24, 128, 192, .30),
                onSelected: (valor){
                  setState(() {
                    intereses['Deportes'] = valor;
                  });
                },
                selectedColor: Color.fromRGBO(24, 128, 192, .30),
              ),
              FilterChip(
                label: Text('Historia'),
                labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Color.fromRGBO(24, 128, 192, 1.0)),
                selected: intereses['Historia'],
                backgroundColor: Color.fromRGBO(24, 128, 192, .30),
                onSelected: (valor){
                  setState(() {
                    intereses['Historia'] = valor;
                  });
                },
                selectedColor: Color.fromRGBO(24, 128, 192, .30),
              ),
              FilterChip(
                label: Text('Tecnología'),
                labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Color.fromRGBO(24, 128, 192, 1.0)),
                selected: intereses['Tecnología'],
                backgroundColor: Color.fromRGBO(24, 128, 192, .30),
                onSelected: (valor){
                  setState(() {
                    intereses['Tecnología'] = valor;
                  });
                },
                selectedColor: Color.fromRGBO(24, 128, 192, .30),
              ),
            ],
          ),
        ],
      )
    );
  }
  Widget _btn(String accion, DocumentSnapshot usuario){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        textColor: Colors.white,
        color: Colors.blueAccent,
        child: Text(accion),
        onPressed: (){
         (accion == 'Aceptar') ? _submit(usuario) : Navigator.pop(context); 
        },
      ),
    );
  }
  void _submit(DocumentSnapshot usuario){
    if(formKey.currentState.validate()){
      formKey.currentState.save();
      Map<String, dynamic> datos = {
        'universidad': universidad,
        'carrera': carrera,
        'expediente': expediente,
        'habilidades': usuario['habilidades'],
        'intereses': usuario['intereses'],
      }; 
      Firestore.instance.collection('usuarios').document(prefs.uid).updateData(datos);
      Navigator.pop(context);
    }
  }
}