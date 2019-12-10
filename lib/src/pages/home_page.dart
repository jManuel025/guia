import 'package:flutter/material.dart';
import 'package:guiaestudiante/src/pages/advices_page.dart';
import 'package:guiaestudiante/src/pages/profile_page.dart';
import 'package:guiaestudiante/src/pages/projects_page.dart';
import 'package:guiaestudiante/src/pages/recipes_page.dart';
import 'package:guiaestudiante/src/preferencias_usuario/preferencias_usuario.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentIndex = 0;
  final prefs = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    prefs.ultimaPagina = 'home'; 
    return Scaffold(
      body: _loadPage(currentIndex),
      bottomNavigationBar: _bottomBar(),
    );
  }
  Widget _loadPage(int currentPage){
    switch (currentPage) {
      case 0: return ProfilePage();
      case 1: return ProjectsPage();
      case 2: return AdvicesPage();
      default: 
        return RecipesPage();
    }
  }

  Widget _bottomBar(){
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: (index){
        setState(() {
          currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          title: Text('Perfil')
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.work),
          title: Text('Proyectos')
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.comment),
          title: Text('Consejos')
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_dining),
          title: Text('Recetas')
        )
      ],
    );
  }
}
  

// Widget _tarjetas(BuildContext context){
//   return SingleChildScrollView(
//     child: Table(
//       children: [
//         TableRow(
//           children: [
//             _tarjeta('Recetas', 'assets/recetas.png', context, 'recipes'),
//             _tarjeta('Proyectos', 'assets/proyectos.png', context, 'projects'),
//           ]
//         ),
//         TableRow(
//           children: [
//             _tarjeta('Consejos', 'assets/consejos.png', context, 'advices'),
//             _tarjeta('Mi perfil', 'assets/usuario.png', context, 'profile'),
//           ]
//         ),
//       ]
//     ),
//   );
// }
//   Widget _tarjeta(String texto, String rutaImagen, BuildContext context, String pantalla){
//     return Container(
//       height: 180.0,
//       margin: EdgeInsets.all(10.0),
//       decoration: BoxDecoration(
//         // color: Color.fromRGBO(197, 216, 217, 0.20),
//         borderRadius: BorderRadius.circular(15.0)
//       ),
//       child: Card(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
//         elevation: 3.0,
//         child: Stack(
//           children: <Widget>[
//             Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: <Widget>[
//                   SizedBox(height: 5.0),
//                   Image(
//                     image: AssetImage(rutaImagen),
//                     height: 80.0,
//                   ),
//                   Text(texto, style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 17.5)),
//                   SizedBox(height: 5.0),
//                 ],
//               ),
//             ), 
//             Container(
//               height: double.infinity,
//               width: double.infinity,
//               child: FlatButton(
//                 child: SizedBox(),
//                 onPressed: () => Navigator.pushNamed(context, pantalla),
//               ),
//             )
//           ],
//         ),
//       )
//     );
//   }