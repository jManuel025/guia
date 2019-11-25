import 'package:flutter/material.dart';
import 'package:guiaestudiante/src/blocs/provider.dart';
import 'package:guiaestudiante/src/pages/advices_form_page.dart';
import 'package:guiaestudiante/src/pages/advices_page.dart';
import 'package:guiaestudiante/src/pages/home_page.dart';
import 'package:guiaestudiante/src/pages/login_page.dart';
import 'package:guiaestudiante/src/pages/profile_page.dart';
import 'package:guiaestudiante/src/pages/projects_form_page.dart';
import 'package:guiaestudiante/src/pages/projects_page.dart';
import 'package:guiaestudiante/src/pages/recipes_form_page.dart';
import 'package:guiaestudiante/src/pages/recipes_list_page.dart';
import 'package:guiaestudiante/src/pages/recipes_page.dart';
import 'package:guiaestudiante/src/pages/register_page.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Guía del estudiante',
        initialRoute: 'login',
        routes: {
          'login'   : (BuildContext context) => LoginPage(),
          'register': (BuildContext context) => RegisterPage(),
          'home'    : (BuildContext context) => HomePage(),
          'recipes' : (BuildContext context) => RecipesPage(),
          'recipes_list' : (BuildContext context) => RecipesListPage(),
          'recipes_form' : (BuildContext context) => RecipesFormPage(),
          'projects': (BuildContext context) => ProjectsPage(),
          'projects_form' : (BuildContext context) => ProjectsFormPage(),
          'advices' : (BuildContext context) => AdvicesPage(),
          'advices_form' : (BuildContext context) => AdvicesFormPage(),
          'profile' : (BuildContext context) => ProfilePage(),
        },
        theme: ThemeData(
          primaryColor: Color.fromRGBO(20, 136, 204, 1.0)
        ),
      ),
    );
  }
}