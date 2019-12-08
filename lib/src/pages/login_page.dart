import 'package:flutter/material.dart';
import 'package:guiaestudiante/src/blocs/register_bloc.dart';
import 'package:guiaestudiante/src/blocs/provider.dart';
import 'package:guiaestudiante/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:guiaestudiante/src/providers/user_provider.dart';
import 'package:guiaestudiante/src/utils/utils.dart';

class LoginPage extends StatelessWidget{

  final userProvider = new UserProvider();
  final prefs = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    prefs.ultimaPagina = 'login';
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          _login(context),
        ],
      ),
    );
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
    final bloc = Provider.de(context);
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
                // _username(bloc),
                _email(bloc),
                SizedBox(height: 30.0,),
                _password(bloc),
                SizedBox(height: 30.0,),
                _boton(context, bloc),
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
    // Widget _username(LoginBloc bloc){
    //   return StreamBuilder(
    //     stream: bloc.usernameStream,
    //     builder: (BuildContext context, AsyncSnapshot snapshot){
    //       return Container(
    //         padding: EdgeInsets.symmetric(horizontal: 20.0),
    //         child: TextField(
    //           decoration: InputDecoration(
    //             icon: Icon(Icons.person, color: Color.fromRGBO(20, 136, 204, 1.0)),
    //             labelText: 'Nombre de usuario',
    //           ),
    //           onChanged: bloc.changeUsername,
    //         ),
    //       );
    //     },
    //   );
    // }

    Widget _email(LoginBloc bloc){
      return StreamBuilder(
        stream: bloc.emailStream,
        builder: (BuildContext context, AsyncSnapshot snapshot){
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                icon: Icon(Icons.alternate_email, color: Color.fromRGBO(20, 136, 204, 1.0)),
                labelText: 'Correo electrónico',
                // counterText: snapshot.data,
                errorText: snapshot.error
              ),
              onChanged: bloc.changeEmail,
            ),
          );
        },
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
              ),
              onChanged: bloc.changePassword,
            ),
          );
        },
      );
    }
    Widget _boton(BuildContext context, LoginBloc bloc){
      return StreamBuilder(
        stream: bloc.formValidStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
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
            onPressed: snapshot.hasData ? () => _signin(bloc, context): null,
            // 
          );
        }
      );
    }
      _signin(LoginBloc bloc, BuildContext context) async {
        Map info = await userProvider.login(bloc.email, bloc.password);
        if(info['ok']){
          Navigator.pushReplacementNamed(context, 'home');
        }
        else{
          mostrarAlerta(context, info['mensaje']);
        }
      }

    Widget _botonAlt(String accion, BuildContext context, String pantalla){
      return FlatButton(
        child: Text(accion, style: TextStyle(color: Colors.blueGrey)),
        onPressed: () => Navigator.pushNamed(context, pantalla),
      );
    }
}