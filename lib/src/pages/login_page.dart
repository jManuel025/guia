import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          _login(context),
        ],
      ),
    );
  }
}

Widget _login(context){
  return Stack(
    children: <Widget>[
      _fondo(),
      _formulario(context),
    ],
  );
}
  Widget _fondo(){
    final fondo = Container(
      width: double.infinity,
      height: double.infinity,
    );
    final cuadrogradiente = Container(
      width: double.infinity,
      height: 300.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset(0, 0),
          end: FractionalOffset(1, 1),
          colors: [
            Color.fromRGBO(20, 136, 204, 1.0),
            Color.fromRGBO(43, 50, 178, 1.0),
          ],
        )
      ),
    );
    return Stack(
      children: <Widget>[
        fondo,
        cuadrogradiente,
        Container(
          padding: EdgeInsets.only(top: 130.0),
          child: Column(
            children: <Widget>[
              Center(
                child: Text('Guía del estudiante', style: TextStyle(color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold)),
              )
            ],
          ),
        ),
      ],
    );
  }
  Widget _formulario(BuildContext context){
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: 170.0,
            ),
          ),
          Container(
            width: size.width * 0.85,
            margin: EdgeInsets.symmetric(vertical: 20.0),
            padding: EdgeInsets.symmetric(vertical: 40.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 3.0,
                  offset: Offset(0.0, 5.0),
                  spreadRadius: 3.0
               )
              ]
            ),
            child: Column(
              children: <Widget>[
                Text('Iniciar sesión', style: TextStyle(color: Colors.blueGrey, fontSize: 20.0, )),
                SizedBox(height: 30.0,),
                _username(),
                SizedBox(height: 30.0,),
                _password(),
                SizedBox(height: 30.0,),
                _boton(context),
              ],
            ),
          ),
          _botonAlt('Crear cuenta', context, 'register'),
          _botonAlt('¿Olvidaste tu contraseña?', context, 'definirruta')
          // SizedBox(height: 60.0),
        ],
      ),
    );
  }
    Widget _username(){
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          decoration: InputDecoration(
            icon: Icon(Icons.person, color: Color.fromRGBO(20, 136, 204, 1.0)),
            labelText: 'Nombre de usuario',
          ),
        ),
      );
    }
    Widget _password(){
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          obscureText: true,
          decoration: InputDecoration(
            icon: Icon(Icons.lock, color: Color.fromRGBO(20, 136, 204, 1.0)),
            labelText: 'Contraseña',
          ),
        ),
      );
    }
    Widget _boton(BuildContext context){
      return RaisedButton(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
          child: Text('Iniciar'),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        elevation: 0.0,
        color: Color.fromRGBO(20, 136, 204, 1.0),
        textColor: Colors.white,
        onPressed: () => Navigator.pushReplacementNamed(context, 'home'),
      );
    }
    Widget _botonAlt(String accion, BuildContext context, String pantalla){
      return FlatButton(
        child: Text(accion, style: TextStyle(color: Colors.blueGrey)),
        onPressed: () => Navigator.pushReplacementNamed(context, pantalla),
      );
    }
