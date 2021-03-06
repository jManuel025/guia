import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:guiaestudiante/src/blocs/provider.dart';
import 'package:guiaestudiante/src/pages/advices_favorites_page.dart';
import 'package:guiaestudiante/src/pages/advices_form_page.dart';
import 'package:guiaestudiante/src/pages/advices_page.dart';
import 'package:guiaestudiante/src/pages/creations_page.dart';
import 'package:guiaestudiante/src/pages/home_page.dart';
import 'package:guiaestudiante/src/pages/login_page.dart';
import 'package:guiaestudiante/src/pages/profile_form_page.dart';
import 'package:guiaestudiante/src/pages/profile_page.dart';
import 'package:guiaestudiante/src/pages/project_update_form.dart';
import 'package:guiaestudiante/src/pages/projects_detail_page.dart';
import 'package:guiaestudiante/src/pages/projects_form_page.dart';
import 'package:guiaestudiante/src/pages/projects_page.dart';
import 'package:guiaestudiante/src/pages/recipes_detail_page.dart';
import 'package:guiaestudiante/src/pages/recipes_form_page.dart';
import 'package:guiaestudiante/src/pages/recipes_list_page.dart';
import 'package:guiaestudiante/src/pages/recipes_page.dart';
import 'package:guiaestudiante/src/pages/recipes_update_form.dart';
import 'package:guiaestudiante/src/pages/register_page.dart';
import 'package:guiaestudiante/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:flutter/services.dart';

class MyApp extends StatelessWidget{
  final prefs = new PreferenciasUsuario();
  // await prefs.initPrefs();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          // ... app-specific localization delegate[s] here
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', 'EN'), // English
          const Locale('es', 'ES'), 
        ],
        title: 'Guía del estudiante',
        initialRoute: prefs.ultimaPagina,
        routes: {
          'login'   : (BuildContext context) => LoginPage(),
          'register': (BuildContext context) => RegisterPage(),
          'home'    : (BuildContext context) => HomePage(),
          'recipes' : (BuildContext context) => RecipesPage(),
          'recipes_list' : (BuildContext context) => RecipesListPage(),
          'recipes_form' : (BuildContext context) => RecipesFormPage(),
          'recipe_update_form' : (BuildContext context) => RecipesUpdtForm(),
          'recipe_detail': (BuildContext context) => RecipeDetailPage(),
          'projects': (BuildContext context) => ProjectsPage(),
          'projects_form' : (BuildContext context) => ProjectsFormPage(),
          'project_update_form' : (BuildContext context) => ProjectUpdateForm(),
          'project_detail': (BuildContext context) => ProjectDetailPage(),
          'advices' : (BuildContext context) => AdvicesPage(),
          'advices_form' : (BuildContext context) => AdvicesFormPage(),
          'fav_advices_page' : (BuildContext context) => FavAdvicesPage(),
          'profile' : (BuildContext context) => ProfilePage(),
          'update_profile' : (BuildContext context) => UpdtProfiePage(),
          'cre_page': (BuildContext context) => CreationPage(),
        },
        theme: ThemeData(
          primaryColor: Color.fromRGBO(20, 136, 204, 1.0),
          // backgroundColor: Colors.white
        ),
      ),
    );
  }
}