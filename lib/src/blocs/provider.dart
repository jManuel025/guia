import 'package:flutter/material.dart';
import 'package:guiaestudiante/src/blocs/register_bloc.dart';
export 'package:guiaestudiante/src/blocs/register_bloc.dart';

class Provider extends InheritedWidget{
  final registerBloc = RegisterBloc();
  
  Provider({Key key, Widget child})
    : super(key:key, child:child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static RegisterBloc of (BuildContext context){
    return (context.inheritFromWidgetOfExactType(Provider) as Provider).registerBloc;
  }
}