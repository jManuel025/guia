import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:guiaestudiante/src/utils/icon_string_util.dart';

class RecipesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recetas'),
      ),
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
            Table(
            children: [
              TableRow(
                children: [
                  _tarjeta('Desayuno', 'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F44%2F2019%2F08%2F26232310%2F6183602.jpg&q=85', context, 'recipes_list', 'free_breakfast'),
                  _tarjeta('Comida', 'https://www.diabetes.org/sites/default/files/styles/crop_large/public/2019-06/Healthy%20Food%20Made%20Easy%20-min.jpg', context, 'recipes_list', 'fastfood'),
                ]
              ),
              TableRow(
                children: [
                  _tarjeta('Cena', 'https://cdn-image.foodandwine.com/sites/default/files/1560953596/teriyaki-chicken-bowl-panera-dinner-menu-FT-BLOG0619.jpg', context, 'recipes_list', 'brightness_2'),
                  _tarjeta('Bebidas', 'https://www.nexgenus.com/Portals/1/xBlog/uploads/2019/4/22/Coolers-powdered-soft-drink-800-800x800.png', context, 'recipes_list', 'local_drink'),
                ]
              ),
              TableRow(
                children: [
                  _tarjeta('Ensaladas', 'https://citelis.com.mx/uploads/c114e99ccd3b0631db97d0ccbc12e13c.jpg', context, 'recipes_list', 'healing'),
                  _tarjeta('Postres', 'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fcdn-image.foodandwine.com%2Fsites%2Fdefault%2Ffiles%2FHD-200912-r-raspberry-macarons.jpg&w=400&q=85', context, 'recipes_list', 'cake'),
                ]
              ),
              TableRow(
                children: [
                  _tarjeta('Sopas', 'https://media.olivegarden.com/en_us/images/product/soup-array-dpv-590x365.jpg', context, 'recipes_list', 'whatshot'),
                  _tarjeta('Explorar', 'https://www.idealhomeshow.co.uk/images/2019/03/b0e2ee2121.jpg', context, 'recipes_list', 'search'),
                ]
              ),
            ]
          )
        ],
      ),
    ),
  );
}
  Widget _tarjeta(String texto, String rutaImagen, BuildContext context, String pantalla, String icono){
    return Container(
      height: 145.0,
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
              color: Color.fromRGBO(124, 130, 130, .5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  getIcon(icono),
                  SizedBox(height: 10.0,),
                  Text(texto, style: TextStyle(color: Colors.white, fontSize: 17.5, fontWeight: FontWeight.bold)),
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