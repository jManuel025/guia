import 'package:flutter/material.dart';
import 'package:guiaestudiante/src/blocs/advices_bloc.dart';
export 'package:guiaestudiante/src/blocs/advices_bloc.dart';
import 'package:guiaestudiante/src/blocs/register_bloc.dart';
export 'package:guiaestudiante/src/blocs/register_bloc.dart';

class Provider extends InheritedWidget {
  final registerBloc = RegisterBloc();
  final loginBloc = LoginBloc();
  final _advicesBloc = AdvicesBloc();

  Provider({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static RegisterBloc of(BuildContext context) {
    // return (context.inheritFromWidgetOfExactType(Provider) as Provider).registerBloc;
    return (context.dependOnInheritedWidgetOfExactType(aspect: Provider)
            as Provider)
        .registerBloc;
  }

  static LoginBloc de(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType(aspect: Provider)
            as Provider)
        .loginBloc;
  }

  static AdvicesBloc advicesBloc(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType(aspect: Provider)
            as Provider)
        ._advicesBloc;
  }
}
