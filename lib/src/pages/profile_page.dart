import 'package:flutter/material.dart';
import 'package:guiaestudiante/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:guiaestudiante/src/utils/icon_string_util.dart';

class ProfilePage extends StatelessWidget {
  final prefs = new PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              // color: Colors.white,
              height: size.height * 0.25,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        alignment: Alignment(-1.0, 0.0),
                        padding: EdgeInsets.all(5.0),
                        // color: Colors.black,
                        width: size.width * 0.30,
                        height: size.height * 0.10,
                        child: CircleAvatar(
                          child: Text('LS', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
                          radius: 60.0,
                        ),
                      ),
                      Container(
                        alignment: Alignment(-1.0, 0.0),
                        padding: EdgeInsets.all(5.0),
                        // color: Colors.greenAccent,
                        width: size.width * 0.70,
                        height: size.height * 0.10,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Nombre de usuario', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.5)),
                            Text(prefs.email, style: TextStyle(fontSize: 15, color: Colors.blueGrey))
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        alignment: Alignment(-1.0, 0.0),
                        padding: EdgeInsets.only(left: 25.0),
                        // color: Colors.blue,
                        width: size.width * 0.5,
                        height: size.height * 0.05,
                        child: Text('Puntuacion', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                      ),
                      Container(
                        // color: Colors.yellow,
                        width: size.width * 0.5,
                        height: size.height * 0.05,
                      ),
                    ],
                  ),
                ],
              )
            ),
            Container(
              color: Colors.blue,
              height: (size.height * 0.75) - 80.0,
              width: double.infinity,
              child: DefaultTabController(
                length: 3,
                child: Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.white24,
                    elevation: 0.0,
                    automaticallyImplyLeading: false,
                    title: TabBar(
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        Tab(text: 'Favoritos',), //icon: Icon(Icons.local_dining)
                        Tab(text: 'Aportaciones',),
                        Tab(text: 'Acerca de mi',),
                      ],
                    ),
                  ),
                  body: TabBarView(
                    children: [
                      _favCreSection(context),
                      _favCreSection(context),
                      _infoSection(),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      );
  }

  Widget _favCreSection(BuildContext context){
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _cardSection(context, 'Recetas', 'assets/wallRecipes.jpg', 'local_dining'),
            _cardSection(context, 'Proyectos', 'assets/wallProjects.jpg', 'work'),
            _cardSection(context, 'Consejos', 'assets/wallAdvices.jpg', 'add_comment'),
          ],
        ),
      ),
    );
  }
    Widget _cardSection(BuildContext context, String nombre, String imageRoute, String icono){
      final size = MediaQuery.of(context).size;
      return Container(
        height: size.height * 0.15,
        margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          elevation: 0.0,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Image(
                image: AssetImage(imageRoute),
                fit: BoxFit.cover,
              ),
              Container(
                height: double.infinity,
                width: double.infinity,
                color: Color.fromRGBO(124, 130, 130, .4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[ 
                    getIcon(icono),
                    SizedBox(height: 10.0,),
                    Text(nombre, style: TextStyle(color: Colors.white, fontSize: 17.5, fontWeight: FontWeight.bold)),
                  ],
                )
              ),
              FlatButton(
                child: SizedBox(),
                onPressed: () {},
              ),
            ],
          ),
        )
      );
    }
  Widget _infoSection(){
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[

          ],
        ),
      ),
    );
  }                   
}