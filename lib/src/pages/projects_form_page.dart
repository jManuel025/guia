import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:guiaestudiante/src/models/projects_model.dart';
import 'package:guiaestudiante/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:guiaestudiante/src/providers/project_provider.dart';
import 'package:guiaestudiante/src/utils/utils.dart' as utils;

class ProjectsFormPage extends StatefulWidget {
  @override
  _ProjectsFormPageState createState() => _ProjectsFormPageState();
}

class _ProjectsFormPageState extends State<ProjectsFormPage> {
  final projectsProvider = new ProjectsProvider();
  final formKey = GlobalKey<FormState>();
  final scaffolkey = GlobalKey<ScaffoldState>();
  ProjectModel project = ProjectModel();
  final prefs = new PreferenciasUsuario();

  bool humanidades = false;
  bool ingenieria = false;
  bool csociales = false;
  bool artes = false;
  bool tecnologia = false;

  @override
  Widget build(BuildContext context) {

    final ProjectModel projectData = ModalRoute.of(context).settings.arguments;
    if(projectData != null){
      project = projectData;
    }
    return Scaffold(
      key: scaffolkey,
      appBar: AppBar(
        title: Text('Nuevo proyecto'),
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
                    child: _titulo()
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: _descripcion()
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: _contacto()
                  ),
                  _remuneracion(),
                  // Divider(thickness: 1.0),
                  _duracion(),
                  // CATEGORIAS
                  // Divider(thickness: 1.0),
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
                              selected: humanidades,
                              backgroundColor: Color.fromRGBO(24, 128, 192, .30),
                              onSelected: (valor){
                                setState(() {
                                  humanidades = valor;
                                });
                              },
                              selectedColor: Color.fromRGBO(24, 128, 192, .30),
                            ),
                            FilterChip(
                              label: Text('Ingeniería'),
                              labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Color.fromRGBO(24, 128, 192, 1.0)),
                              selected: ingenieria,
                              backgroundColor: Color.fromRGBO(24, 128, 192, .30),
                              onSelected: (valor){
                                setState(() {
                                  ingenieria = valor;
                                });
                              },
                              selectedColor: Color.fromRGBO(24, 128, 192, .30),
                            ),
                            FilterChip(
                              label: Text('Ciencias sociales'),
                              labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Color.fromRGBO(24, 128, 192, 1.0)),
                              selected: csociales,
                              backgroundColor: Color.fromRGBO(24, 128, 192, .30),
                              onSelected: (valor){
                                setState(() {
                                  csociales = valor;
                                });
                              },
                              selectedColor: Color.fromRGBO(24, 128, 192, .30),
                            ),
                            FilterChip(
                              label: Text('Artes'),
                              labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Color.fromRGBO(24, 128, 192, 1.0)),
                              selected: artes,
                              backgroundColor: Color.fromRGBO(24, 128, 192, .30),
                              onSelected: (valor){
                                setState(() {
                                  artes = valor;
                                });
                              },
                              selectedColor: Color.fromRGBO(24, 128, 192, .30),
                            ),
                            FilterChip(
                              label: Text('Tecnología'),
                              labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Color.fromRGBO(24, 128, 192, 1.0)),
                              selected: tecnologia,
                              backgroundColor: Color.fromRGBO(24, 128, 192, .30),
                              onSelected: (valor){
                                setState(() {
                                  tecnologia = valor;
                                });
                              },
                              selectedColor: Color.fromRGBO(24, 128, 192, .30),
                            ),
                          ],
                        ),
                  // BOTONES ACEPTAR - CANCELAR
                  Divider(height: 0.0, thickness: 1.0),
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

  Widget _titulo(){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          icon: Icon(Icons.content_paste),
          labelText: 'Titulo del proyecto',
        ),
      onSaved: (value) => project.titulo = value,
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
  Widget _descripcion(){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          icon: Icon(Icons.description),
          labelText: 'Describe el proyecto',
          border: OutlineInputBorder()
        ),
        maxLines: 5,
      onSaved: (value) => project.descripcion = value,
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
  Widget _contacto(){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          icon: Icon(Icons.person_pin),
          labelText: 'Contacto',
        ),
      onSaved: (value) => project.contacto = value,
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
  Widget _remuneracion(){
    return SwitchListTile(
      value:  project.tipoRemuneracion,
      title: Text('Remuneración económica'),
      onChanged: (value) => setState((){
        project.tipoRemuneracion = value;
      }),
    );
  }
  Widget _duracion(){
    return TextFormField(
      keyboardType: TextInputType.number,
      initialValue: project.duracion.toString(),
      decoration: InputDecoration(
        icon: Icon(Icons.calendar_today),
        labelText: 'Duracion aproximada (días)',
      ),
      onSaved: (value) => project.duracion = int.parse(value),
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

  // Widget _area(){
  //   return Container(
  //     padding: EdgeInsets.symmetric(horizontal: 5.0),
  //     child: RaisedButton(
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(25),
  //       ),
  //       color: Colors.blue,
  //       textColor: Colors.white,
  //       disabledColor: Colors.grey,
  //       child: Text('Area 1'),
  //       onPressed: (){},
  //     ),
  //   );
  // }

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
      formKey.currentState.save();
      if(project.id == null){
        projectsProvider.createProject(project);
      }
      Map<String, bool> areas = {
        'Humanidades': humanidades,
        'Ingeniería': ingenieria,
        'Ciencias sociales': csociales,
        'Artes': artes,
        'Tecnología': tecnologia,
      };
      Map<String, dynamic> datos = {
        "autor": prefs.name,
        "usuario_id": prefs.uid,
        "titulo": project.titulo,
        "descripcion": project.descripcion,
        "contacto": project.contacto,
        "tipoRemuneracion": project.tipoRemuneracion,
        "duracion": project.duracion,
        "areas": areas,
      };
      Firestore.instance.collection('proyectos').add(datos);
      Navigator.pop(context);
    }
  }
}