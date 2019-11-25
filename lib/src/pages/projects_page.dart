import 'package:flutter/material.dart';

class ProjectsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Proyectos'),
        centerTitle: true,
      ),
      body: Container(),
      floatingActionButton: _btnCrearProyecto(context),
    );
  }
  _btnCrearProyecto(BuildContext context){
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () => Navigator.pushNamed(context, 'projects_form'),
    ); 
  }
}