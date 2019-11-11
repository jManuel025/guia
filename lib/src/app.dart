import 'package:flutter/material.dart';
import 'package:guiaestudiante/src/blocs/provider.dart';
import 'package:guiaestudiante/src/pages/advices_page.dart';
import 'package:guiaestudiante/src/pages/home_page.dart';
import 'package:guiaestudiante/src/pages/logreg_page.dart';
import 'package:guiaestudiante/src/pages/profile_page.dart';
import 'package:guiaestudiante/src/pages/projects_page.dart';
import 'package:guiaestudiante/src/pages/recipes_page.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Guía del estudiante',
        initialRoute: 'login',
        routes: {
          'login'   : (BuildContext context) => LogRegPage(),
          'home'    : (BuildContext context) => HomePage(),
          'recipes' : (BuildContext context) => RecipesPage(),
          'projects': (BuildContext context) => ProjectsPage(),
          'advices' : (BuildContext context) => AdvicesPage(),
          'profile' : (BuildContext context) => ProfilePage(),
        },
        theme: ThemeData(
          primaryColor: Color.fromRGBO(20, 136, 204, 1.0)
        ),
      ),
    );
  }
}