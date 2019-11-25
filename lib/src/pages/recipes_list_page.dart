import 'package:flutter/material.dart';

class RecipesListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listado de recetas'),
        centerTitle: true,
      ),
      body: Container(),
      floatingActionButton: _btnCrearReceta(context),
    );
  }
  _btnCrearReceta(BuildContext context){
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () => Navigator.pushNamed(context, 'recipes_form'),
    ); 
  }
}

