import 'dart:ui';
import 'package:flutter/material.dart';

class RecipesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Recetas'),
      //   centerTitle: true,
      // ),
      body: Center(
        child: _tarjetas(context),
      ),
      floatingActionButton: _btnCrearReceta(context),
    );
  }
}

_btnCrearReceta(BuildContext context){
  return FloatingActionButton(
    child: Icon(Icons.add),
    onPressed: () => Navigator.pushNamed(context, 'recipes_form'),
  ); 
}

Widget _tarjetas(BuildContext context){
  return SafeArea(
    child: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 20.0),
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text('Selecciona una categoría', style: TextStyle(color: Colors.blueGrey, fontSize: 17.5),),
          ),
            Table(
            children: [
              TableRow(
                children: [
                  _tarjeta('Categoria1', 'https://www.animalgourmet.com/wp-content/uploads/2017/09/cel-lisboa-60315-e1504660981599.jpg', context, 'recipes_list'),
                  _tarjeta('Categoria2', 'https://www.animalgourmet.com/wp-content/uploads/2017/09/cel-lisboa-60315-e1504660981599.jpg', context, 'recipes_list'),
                ]
              ),
              TableRow(
                children: [
                  _tarjeta('Categoria3', 'https://www.animalgourmet.com/wp-content/uploads/2017/09/cel-lisboa-60315-e1504660981599.jpg', context, 'recipes_list'),
                  _tarjeta('Categoria4', 'https://www.animalgourmet.com/wp-content/uploads/2017/09/cel-lisboa-60315-e1504660981599.jpg', context, 'recipes_list'),
                ]
              ),
              TableRow(
                children: [
                  _tarjeta('Categoria1', 'https://www.animalgourmet.com/wp-content/uploads/2017/09/cel-lisboa-60315-e1504660981599.jpg', context, 'recipes_list'),
                  _tarjeta('Categoria2', 'https://www.animalgourmet.com/wp-content/uploads/2017/09/cel-lisboa-60315-e1504660981599.jpg', context, 'recipes_list'),
                ]
              ),
              TableRow(
                children: [
                  _tarjeta('Categoria3', 'https://www.animalgourmet.com/wp-content/uploads/2017/09/cel-lisboa-60315-e1504660981599.jpg', context, 'recipes_list'),
                  _tarjeta('Categoria4', 'https://www.animalgourmet.com/wp-content/uploads/2017/09/cel-lisboa-60315-e1504660981599.jpg', context, 'recipes_list'),
                ]
              ),
              TableRow(
                children: [
                  _tarjeta('Categoria1', 'https://www.animalgourmet.com/wp-content/uploads/2017/09/cel-lisboa-60315-e1504660981599.jpg', context, 'recipes_list'),
                  _tarjeta('Categoria2', 'https://www.animalgourmet.com/wp-content/uploads/2017/09/cel-lisboa-60315-e1504660981599.jpg', context, 'recipes_list'),
                ]
              ),
              TableRow(
                children: [
                  _tarjeta('Categoria3', 'https://www.animalgourmet.com/wp-content/uploads/2017/09/cel-lisboa-60315-e1504660981599.jpg', context, 'recipes_list'),
                  _tarjeta('Categoria4', 'https://www.animalgourmet.com/wp-content/uploads/2017/09/cel-lisboa-60315-e1504660981599.jpg', context, 'recipes_list'),
                ]
              ),
            ]
          )
        ],
      ),
    ),
  );
}
  Widget _tarjeta(String texto, String rutaImagen, BuildContext context, String pantalla){
    return Container(
      height: 150.0,
      margin: EdgeInsets.all(15.0),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        elevation: 5.0,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image(
              image: NetworkImage(rutaImagen),
              fit: BoxFit.cover,
            ),
            Container(
              height: double.infinity,
              width: double.infinity,
              color: Color.fromRGBO(124, 130, 130, .7),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.fastfood, size: 50.0, color: Colors.white),
                  SizedBox(height: 10.0,),
                  Text('Categoria', style: TextStyle(color: Colors.white, fontSize: 17.5, fontWeight: FontWeight.bold)),
                ],
              )
            ),
            FlatButton(
              child: SizedBox(),
              onPressed: () => Navigator.pushNamed(context, pantalla),
            ),
          ],
        ),
      )
    );
  }