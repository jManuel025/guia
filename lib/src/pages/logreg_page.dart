import 'package:flutter/material.dart';
import 'package:guiaestudiante/src/blocs/login_bloc.dart';
import 'package:guiaestudiante/src/blocs/provider.dart';

class LogRegPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          _login(context),
          _registro(context),
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
      height: 280.0,
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
          padding: EdgeInsets.only(top: 120.0),
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
              height: 180.0,
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
                Text('Iniciar sesión', style: TextStyle(color: Colors.blueGrey, fontSize: 25.0, )),
                SizedBox(height: 30.0,),
                _usernamel(),
                SizedBox(height: 30.0,),
                _passwordl(),
                SizedBox(height: 30.0,),
                _boton('Iniciar', context),
              ],
            ),
          ),
          FlatButton(
            child: Text('¿Olvido su contraseña?', style: TextStyle(color: Colors.blueGrey)),
            onPressed: () => Navigator.pushNamed(context, 'recuperacionContraseña'),
          ),
          // SizedBox(height: 60.0),
          Icon(Icons.keyboard_arrow_down, size: 50.0, color: Colors.grey)
        ],
      ),
    );
  }
    Widget _usernamel(){
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
    Widget _passwordl(){
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
    Widget _boton(String placeholder, BuildContext context){
      return RaisedButton(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
          child: Text(placeholder),
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

Widget _registro(context){
  return Stack(
    children: <Widget>[
      _fondo(),
      _formRegistro(context),
    ],
  );
}
  Widget _formRegistro(context){
    final bloc = Provider.of(context);
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: 180.0,
            ),
          ),
          Container(
            width: size.width * 0.85,
            margin: EdgeInsets.symmetric(vertical: 10.0),
            padding: EdgeInsets.symmetric(vertical: 30.0),
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
                Text('Registrarme', style: TextStyle(color: Colors.blueGrey, fontSize: 25.0, )),
                SizedBox(height: 10.0,),
                _username(bloc),
                SizedBox(height: 10.0,),
                _email(),
                SizedBox(height: 10.0,),
                _password(bloc),
                SizedBox(height: 10.0,),
                _passwordc(bloc),
                SizedBox(height: 10.0,),
                _birthday(),
                SizedBox(height: 20.0,),
                _boton('Registrar', context),
              ],
            ),
          ),
        ],
      ),
    );
  }
    Widget _username(LoginBloc bloc){
      return StreamBuilder(
        stream: bloc.usernameStream,
        builder: (BuildContext context, AsyncSnapshot snapshot){
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.person, color: Color.fromRGBO(20, 136, 204, 1.0)),
                labelText: 'Nombre de usuario',
                counterText: snapshot.data,
              ),
              onChanged: bloc.changeUsername,
            ),
          );
        }
      );
    }
    Widget _password(LoginBloc bloc){
      return StreamBuilder(
        stream: bloc.passwordStream,
        builder: (BuildContext context, AsyncSnapshot snapshot){
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                icon: Icon(Icons.lock, color: Color.fromRGBO(20, 136, 204, 1.0)),
                labelText: 'Contraseña',
                counterText: snapshot.data,
                errorText: snapshot.error
              ),
              onChanged: bloc.changePassword,
            ),
          );
        },
      );
    }
    Widget _passwordc(LoginBloc bloc){
      return StreamBuilder(
        stream: bloc.passwordStream,
        builder: (BuildContext context, AsyncSnapshot snapshot){
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                icon: Icon(Icons.lock, color: Color.fromRGBO(20, 136, 204, 1.0)),
                labelText: 'Confirma tu contraseña',
                counterText: snapshot.data,
                errorText: snapshot.error
              ),
              onChanged: bloc.changePassword,
            ),
          );
        },
      );
    }
    Widget _email(){
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            icon: Icon(Icons.alternate_email, color: Color.fromRGBO(20, 136, 204, 1.0)),
            labelText: 'Correo electrónico',
          ),
        ),
      );
    }
    Widget _birthday(){
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          keyboardType: TextInputType.datetime,
          // maxLength: 10,
          decoration: InputDecoration(
            icon: Icon(Icons.calendar_today, color: Color.fromRGBO(20, 136, 204, 1.0)),
            labelText: 'Fecha de nacimiento',
            hintText: 'DD/MM/AAAA'
          ),
        ),
      );
    }