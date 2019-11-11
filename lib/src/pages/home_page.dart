import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio'),
        centerTitle: true,
      ),
      body: Center(
        child: _tarjetas(context),
      ),
    );
  }
}

Widget _tarjetas(BuildContext context){
  return SingleChildScrollView(
    child: Table(
      children: [
        TableRow(
          children: [
            _tarjeta('Recetas', 'assets/recetas.png', context, 'recipes'),
            _tarjeta('Proyectos', 'assets/proyectos.png', context, 'projects'),
          ]
        ),
        TableRow(
          children: [
            _tarjeta('Consejos', 'assets/consejos.png', context, 'advices'),
            _tarjeta('Mi perfil', 'assets/usuario.png', context, 'profile'),
          ]
        ),
      ]
    ),
  );
}
  Widget _tarjeta(String texto, String rutaImagen, BuildContext context, String pantalla){
    return Container(
      height: 180.0,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Color.fromRGBO(197, 216, 217, 0.20),
        borderRadius: BorderRadius.circular(15.0)
      ),
      child: Stack(
        children: <Widget>[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                SizedBox(height: 5.0),
                Image(
                  image: AssetImage(rutaImagen),
                  height: 80.0,
                ),
                Text(texto, style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 17.5)),
                SizedBox(height: 5.0),
              ],
            ),
          ), 
          Container(
            height: double.infinity,
            width: double.infinity,
            child: FlatButton(
              child: SizedBox(),
              onPressed: () => Navigator.pushNamed(context, pantalla),
            ),
          )
        ],
      )
    );
  }