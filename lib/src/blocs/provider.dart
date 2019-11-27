import 'package:flutter/material.dart';
import 'package:guiaestudiante/src/blocs/register_bloc.dart';
export 'package:guiaestudiante/src/blocs/register_bloc.dart';
// import 'package:guiaestudiante/src/blocs/login_bloc.dart';
// export 'package:guiaestudiante/src/blocs/login_bloc.dart';

class Provider extends InheritedWidget{
  final registerBloc = RegisterBloc();
  final loginBloc = LoginBloc();
  
  Provider({Key key, Widget child})
    : super(key:key, child:child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static RegisterBloc of (BuildContext context){
    return (context.inheritFromWidgetOfExactType(Provider) as Provider).registerBloc;
  }

  static LoginBloc de (BuildContext context){
    return (context.inheritFromWidgetOfExactType(Provider) as Provider).loginBloc;
  }


}