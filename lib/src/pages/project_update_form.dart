import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:guiaestudiante/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:guiaestudiante/src/utils/utils.dart' as utils;

class ProjectUpdateForm extends StatefulWidget {
  @override
  _ProjectUpdateFormState createState() => _ProjectUpdateFormState();
}

class _ProjectUpdateFormState extends State<ProjectUpdateForm> {
  final formKey = GlobalKey<FormState>();
  final scaffolkey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {

    DocumentSnapshot projectData = ModalRoute.of(context).settings.arguments;
    Map areas = projectData['areas'];
    return Scaffold(
      key: scaffolkey,
      appBar: AppBar(
        title: Text('Editar proyecto'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  // TITULO DEL PROYECTO
                  Container(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: _titulo(projectData)
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: _descripcion(projectData)
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: _contacto(projectData)
                  ),
                  // _remuneracion(projectData),
                  // Divider(thickness: 1.0),
                  _duracion(projectData),
                  // CATEGORIAS
                  // Divider(height: 0.0, thickness: 1.0),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          width: double.infinity,
                          child: Text('Selecciona las áreas a las que pertenece', style: TextStyle(fontSize: 15.0)),
                        ),
                      ],
                    )
                  ),
                  Wrap(
                    spacing: 10.0,
                    runSpacing: 2.0,
                    children: <Widget>[
                      FilterChip(
                        label: Text('Humanidades'),
                        labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Color.fromRGBO(24, 128, 192, 1.0)),
                        selected: areas['Humanidades'],
                        backgroundColor: Color.fromRGBO(24, 128, 192, .30),
                        onSelected: (valor){
                          setState(() {
                            areas['Humanidades'] = valor;
                          });
                        },
                        selectedColor: Color.fromRGBO(24, 128, 192, .30),
                      ),
                      FilterChip(
                        label: Text('Ingeniería'),
                        labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Color.fromRGBO(24, 128, 192, 1.0)),
                        selected: areas['Ingeniería'],
                        backgroundColor: Color.fromRGBO(24, 128, 192, .30),
                        onSelected: (valor){
                          setState(() {
                            areas['Ingeniería'] = valor;
                          });
                        },
                        selectedColor: Color.fromRGBO(24, 128, 192, .30),
                      ),
                      FilterChip(
                        label: Text('Ciencias sociales'),
                        labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Color.fromRGBO(24, 128, 192, 1.0)),
                        selected: areas['Ciencias sociales'],
                        backgroundColor: Color.fromRGBO(24, 128, 192, .30),
                        onSelected: (valor){
                          setState(() {
                            areas['Ciencias sociales'] = valor;
                          });
                        },
                        selectedColor: Color.fromRGBO(24, 128, 192, .30),
                      ),
                      FilterChip(
                        label: Text('Artes'),
                        labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Color.fromRGBO(24, 128, 192, 1.0)),
                        selected: areas['Artes'],
                        backgroundColor: Color.fromRGBO(24, 128, 192, .30),
                        onSelected: (valor){
                          setState(() {
                            areas['Artes'] = valor;
                          });
                        },
                        selectedColor: Color.fromRGBO(24, 128, 192, .30),
                      ),
                      FilterChip(
                        label: Text('Tecnología'),
                        labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Color.fromRGBO(24, 128, 192, 1.0)),
                        selected: areas['Tecnología'],
                        backgroundColor: Color.fromRGBO(24, 128, 192, .30),
                        onSelected: (valor){
                          setState(() {
                            areas['Tecnología'] = valor;
                          });
                        },
                        selectedColor: Color.fromRGBO(24, 128, 192, .30),
                      ),
                    ],
                  ),
                  // BOTONES ACEPTAR - CANCELAR
                  Table(
                    children: [
                      TableRow(
                        children: [
                          _btnCancel(),
                          _btnAccion(projectData),
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
  String nTitulo;
  Widget _titulo(DocumentSnapshot proyecto){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        initialValue: proyecto['titulo'],
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          icon: Icon(Icons.content_paste),
          labelText: 'Titulo del proyecto',
        ),
      onSaved: (value) => nTitulo = value,
      validator: (value){
        if(value.length < 5){
          return 'Ingresa un nombre para el proyecto';
        }
        else{
          return null;
        }
      },
      ),
    );
  }
  String nDesc;
  Widget _descripcion(DocumentSnapshot proyecto){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        initialValue: proyecto['descripcion'],
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          icon: Icon(Icons.description),
          labelText: 'Describe el proyecto',
          border: OutlineInputBorder()
        ),
        maxLines: 5,
      onSaved: (value) => nDesc = value,
      validator: (value){
        if(value.length < 5){
          return 'Es necesaria una descripción';
        }
        else{
          return null;
        }
      },
      ),
    );
  }
  String nContacto;
  Widget _contacto(DocumentSnapshot proyecto){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        initialValue: proyecto['contacto'],
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          icon: Icon(Icons.person_pin),
          labelText: 'Contacto',
        ),
      onSaved: (value) => nContacto = value,
      validator: (value){
        if(value.length < 5){
          return 'Ingresa medio por el cual se puedan poner en contacto contigo';
        }
        else{
          return null;
        }
      },
      ),
    );
  }
  // bool nTRemuneracion;
  // Widget _remuneracion(DocumentSnapshot proyecto){
  //   return SwitchListTile(
  //     value:  proyecto['tipoRemuneracion'],
  //     title: Text('Remuneración económica'),
  //     onChanged: (value) => setState((){
  //       nTRemuneracion = value;
  //     }),
  //   );
  // }
  int nDuracion; 
  Widget _duracion(DocumentSnapshot proyecto){
    return TextFormField(
      keyboardType: TextInputType.number,
      initialValue: proyecto['duracion'].toString(),
      decoration: InputDecoration(
        icon: Icon(Icons.calendar_today),
        labelText: 'Duracion aproximada (días)',
      ),
      onSaved: (value) => nDuracion = int.parse(value),
      validator: (value){
        if(utils.isNumber(value)){
          return null;
        }
        else{
          return 'Solo numeros';
        }
      },
    );
  }
  Widget _btnAccion(DocumentSnapshot project){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        textColor: Colors.white,
        color: Colors.blueAccent,
        child: Text('Aceptar'),
        onPressed: () => _submit(project),
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
  void _submit(DocumentSnapshot project){
    if(formKey.currentState.validate()){
      formKey.currentState.save();
      Map ar = project['areas'];
      Map<String, bool> areas = {
        "Artes": ar['Artes'],
        "Ciencias sociales": ar['Ciencias sociales'],
        "Humanidades": ar['Humanidades'],
        "Ingeniería": ar['Ingeniería'],
        "Tecnología": ar['Tecnología'],
      };
      Map<String, dynamic> datos = {
        "titulo": nTitulo,
        "descripcion": nDesc,
        "contacto": nContacto,
        "duracion": nDuracion,
        "areas": areas
      }; 
      Firestore.instance.collection('proyectos').document(project.documentID).updateData(datos);
      Navigator.pop(context);
    }
  }
}