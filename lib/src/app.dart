import 'package:flutter/material.dart';
import 'package:guiaestudiante/src/blocs/provider.dart';
import 'package:guiaestudiante/src/pages/home_page.dart';
import 'package:guiaestudiante/src/pages/logreg_page.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'IS',
        initialRoute: 'login',
        routes: {
          'login': (BuildContext context) => LogRegPage(),
          'home': (BuildContext context) => HomePage(),
        },
      ),
    );
  }
}