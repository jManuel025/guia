import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:guiaestudiante/src/models/advices_model.dart';
import 'package:guiaestudiante/src/models/users_model.dart';
import 'package:intl/intl.dart';
import 'package:guiaestudiante/src/blocs/register_bloc.dart';
import 'package:guiaestudiante/src/blocs/provider.dart';
import 'package:guiaestudiante/src/providers/user_provider.dart';
import 'package:guiaestudiante/src/utils/utils.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String _fecha = '';
  final userProvider = new UserProvider();

  TextEditingController _dateInputController = new TextEditingController();

  final formKey = GlobalKey<FormState>();
  UserModel user = new UserModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          _registro(context),
        ],
      ),
    );
  }

  Widget _registro(context) {
    return Stack(
      children: <Widget>[
        _fondo(),
        _formRegistro(context),
      ],
    );
  }

  Widget _fondo() {
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
      )),
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
                child: Text('Guía del estudiante',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold)),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _formRegistro(context) {
    final bloc = Provider.of(context);
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: 140.0,
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
                        spreadRadius: 3.0)
                  ]),
              child: Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    Text('Registro',
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 20.0,
                        )),
                    SizedBox(
                      height: 10.0,
                    ),
                    _username(bloc),
                    SizedBox(
                      height: 10.0,
                    ),
                    _email(bloc),
                    SizedBox(
                      height: 10.0,
                    ),
                    _password(bloc),
                    SizedBox(
                      height: 10.0,
                    ),
                    _birthday(context),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Selecciona tu sexo', textAlign: TextAlign.left),
                          _sexo(),
                        ],
                      ),
                    ),
                    _boton(context, bloc),
                  ],
                ),
              )),
          _botonAlt('Ya tengo una cuenta', context, 'login'),
        ],
      ),
    );
  }

  Widget _username(RegisterBloc bloc) {
    return StreamBuilder(
        stream: bloc.usernameStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextFormField(
              initialValue: user.nombre,
              decoration: InputDecoration(
                icon: Icon(Icons.person,
                    color: Color.fromRGBO(20, 136, 204, 1.0)),
                labelText: 'Nombre de usuario',
                // counterText: snapshot.data,
              ),
              onSaved: (value) => user.nombre = value,
              validator: (value) {
                if (value.length < 3) {
                  return 'Ingresa un nombre';
                } else {
                  return null;
                }
              },
              onChanged: bloc.changeUsername,
            ),
          );
        });
  }

  Widget _password(RegisterBloc bloc) {
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextFormField(
            // initialValue: user.password,
            obscureText: true,
            decoration: InputDecoration(
                icon:
                    Icon(Icons.lock, color: Color.fromRGBO(20, 136, 204, 1.0)),
                labelText: 'Contraseña',
                // counterText: snapshot.data,
                errorText: snapshot.error),
            // onSaved: (value) => user.password = value,
            onChanged: bloc.changePassword,
          ),
        );
      },
    );
  }

  Widget _email(RegisterBloc bloc) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextFormField(
            initialValue: user.correo,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                icon: Icon(Icons.alternate_email,
                    color: Color.fromRGBO(20, 136, 204, 1.0)),
                labelText: 'Correo electrónico',
                // counterText: snapshot.data,
                errorText: snapshot.error),
            onSaved: (value) => user.correo = value,
            onChanged: bloc.changeEmail,
          ),
        );
      },
    );
  }

  Widget _birthday(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        enableInteractiveSelection: false,
        controller: _dateInputController,
        decoration: InputDecoration(
          icon: Icon(Icons.calendar_today,
              color: Color.fromRGBO(20, 136, 204, 1.0)),
          labelText: 'Fecha de nacimiento',
        ),
        onSaved: (value) => user.fechaNacimiento = value,
        validator: (value) {
          if (value == null || value == '') {
            return 'Ingresa tu fecha de nacimiento';
          } else {
            return null;
          }
        },
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
          _selectDate(context);
        },
      ),
    );
  }

  _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(1950),
      lastDate: new DateTime(2020),
      locale: Locale('es', 'ES'),
    );

    if (picked != null) {
      setState(() {
        final _formatdate = DateFormat('dd/MM/yyyy');
        _fecha = _formatdate.format(picked);
        _dateInputController.text = _fecha;
      });
    }
  }

  bool masculino = false;
  bool femenino = true;
  Widget _sexo() {
    if (masculino) {
      femenino = !masculino;
    }
    return Wrap(
      spacing: 50.0,
      children: <Widget>[
        ChoiceChip(
          label: Text('Masculino',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          selected: masculino,
          onSelected: (valor) {
            setState(() {
              masculino = valor;
              print(masculino);
            });
          },
          selectedColor: Colors.blue,
        ),
        ChoiceChip(
          label: Text('Femenino',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          selected: femenino,
          onSelected: (x) {
            setState(() {
              femenino = x;
              print(femenino);
            });
          },
          selectedColor: Colors.blue,
        )
      ],
    );
  }

  Widget _boton(BuildContext context, RegisterBloc bloc) {
    return StreamBuilder(
        stream: bloc.formValidStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return ElevatedButton(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
              child: Text('Registrarme'),
            ),
            // shape: RoundedRectangleBorder(
            //   borderRadius: BorderRadius.circular(5.0),
            // ),
            // elevation: 0.0,
            // color: Color.fromRGBO(20, 136, 204, 1.0),
            // textColor: Colors.white,
            onPressed: snapshot.hasData ? () => _signup(bloc, context) : null,
          );
        });
  }

  _signup(RegisterBloc bloc, BuildContext context) async {
    Map info =
        await userProvider.newUser(bloc.username, bloc.email, bloc.password);
    if (info['ok']) {
      Navigator.pushReplacementNamed(context, 'login');
      _submit();
    } else {
      mostrarAlerta(
          context,
          (info['mensaje'] == "EMAIL_EXISTS")
              ? 'Correo no disponible'
              : Container());
    }
  }

  _submit() {
    if (!formKey.currentState.validate()) return;
    formKey.currentState.save();
    Map<String, dynamic> datos = {
      'nombre': user.nombre,
      'correo': user.correo,
      'fechaNacimiento': user.fechaNacimiento,
      "expediente": '',
      "universidad": '',
      "carrera": '',
      "sexo": masculino,
      "habilidades": {
        "Comunicacion": false,
        "Creatividad": false,
        "Escucha": false,
        "Liderazgo": false,
        "Razonamiento": false,
      },
      "intereses": {
        "Arte": false,
        "Ciencia": false,
        "Deportes": false,
        "Tecnología": false,
        "Historia": false,
      },
      "tipoUsuario": false, //normal
      // "puntuacion": 5.0
    };
    Firestore.instance
        .collection('usuarios')
        .document(prefs.uid)
        .setData(datos);
  }

  Widget _botonAlt(String accion, BuildContext context, String pantalla) {
    return TextButton(
      child: Text(accion, style: TextStyle(color: Colors.blueGrey)),
      onPressed: () => Navigator.pushReplacementNamed(context, pantalla),
    );
  }
}
