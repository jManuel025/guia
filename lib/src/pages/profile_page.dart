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
            _header(size, context),
            _body(size, context),
          ],
        ),
      );
  }

  Widget _header(dynamic size, BuildContext context){
    return Container(
      height: size.height * 0.20,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                alignment: Alignment(-1.0, 0.0),
                padding: EdgeInsets.all(5.0),
                width: size.width * 0.30,
                height: size.height * 0.10,
                child: CircleAvatar(
                  child: Image(
                    image: AssetImage('assets/usuario.png'),
                    height: 50.0,
                  ),
                  radius: 60.0,
                ),
              ),
              Container(
                alignment: Alignment(-1.0, 0.0),
                padding: EdgeInsets.all(5.0),
                // width: size.width * 0.70,
                // height: size.height * 0.10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(prefs.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.5)),
                    Text(prefs.email, style: TextStyle(fontSize: 15, color: Colors.blueGrey))
                  ],
                ),
              ),
              IconButton(
                icon: Icon(Icons.exit_to_app),
                onPressed: () => Navigator.pushReplacementNamed(context, 'login'),
              )
            ],
          ),
        ],
      )
    );
  }
  Widget _body(dynamic size, BuildContext context){
    return Container(
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
                Tab(text: 'Favoritos'),
                Tab(text: 'Aportaciones'),
                Tab(text: 'Acerca de mi'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              _favSection(context),
              _creSection(context),
              _infoSection(context),
            ],
          ),
        ),
      ),
    );
  }
    Widget _favSection(BuildContext context){
      return Container(
        color: Colors.white,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _cardSection(context, 'Recetas', 'assets/wallRecipes.jpg', 'local_dining', 'fav_advices_page', 'recetas'),
                _cardSection(context, 'Proyectos', 'assets/wallProjects.jpg', 'work', 'fav_advices_page', 'proyectos'),
                _cardSection(context, 'Consejos', 'assets/wallAdvices.jpg', 'add_comment', 'fav_advices_page', 'consejos'),
              ],
            ),
          ),
        ),
      );
    }
    Widget _creSection(BuildContext context){
      return Container(
        color: Colors.white,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _cardSection(context, 'Recetas', 'assets/wallRecipes.jpg', 'local_dining', 'cre_page', 'recetas'),
                _cardSection(context, 'Proyectos', 'assets/wallProjects.jpg', 'work', 'cre_page', 'proyectos'),
                _cardSection(context, 'Consejos', 'assets/wallAdvices.jpg', 'add_comment', 'cre_page', 'consejos'),
              ],
            ),
          ),
        ),
      );
    }
      Widget _cardSection(BuildContext context, String nombre, String imageRoute, String icono, String pantalla, String coleccion){
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
                  onPressed: () => Navigator.pushNamed(context, pantalla, arguments: coleccion),
                ),
              ],
            ),
          )
        );
      }
    Widget _infoSection(BuildContext context){
      return Container(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  // color: Colors.red,
                  width: double.infinity,
                  // height: MediaQuery.of(context).size.height * 0.50,
                  child: Column(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0)
                              ),
                              child: Container(
                                padding: EdgeInsets.all(20.0),
                                child: Column(
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        // IconButton(
                                        //   padding: EdgeInsets.only(bottom: 20.0),
                                        //   icon: Icon(Icons.settings),
                                        //   onPressed: (){},
                                        // ),
                                        IconButton(
                                          padding: EdgeInsets.only(bottom: 20.0),
                                          icon: Icon(Icons.edit),
                                          onPressed: (){},
                                        )
                                      ],
                                    ),
                                    Text('Universidad', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0)),
                                    Text('Universidad Autónoma Querétaro'),
                                    Divider(height: 30.0,),
                                    Text('Carrera', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0)),
                                    Text('Ingeniería de Software'),
                                    Divider(height: 30.0,),
                                    Text('Expediente', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0)),
                                    Text('267795'),
                                    Divider(height: 30.0,),
                                    Text('Fecha de nacimiento', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0)),
                                    Text('25/08/1999'),
                                    Divider(height: 30.0,),
                                    Text('Sexo', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0)),
                                    Text('Masculino'),
                                    Divider(height: 30.0,),
                                    Text('Habilidades', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0)),
                                    Wrap(
                                      direction: Axis.horizontal,
                                      alignment: WrapAlignment.center,
                                      spacing: 5.0,
                                      children: <Widget>[
                                        Chip(
                                          label: Text('Comunicación', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                                          backgroundColor: Colors.blue,
                                        ),
                                        Chip(
                                          label: Text('Confianza', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                                          backgroundColor: Colors.blue,
                                        ),
                                        Chip(
                                          label: Text('Empatía', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                                          backgroundColor: Colors.blue,
                                        ),
                                        Chip(
                                          label: Text('Razonamiento', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                                          backgroundColor: Colors.blue,
                                        ),
                                        Chip(
                                          label: Text('Creatividad', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                                          backgroundColor: Colors.blue,
                                        ),
                                      ],
                                    ),
                                    //   ],
                                    // ),
                                    Divider(height: 30.0,),
                                    Text('Intereses', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0)),
                                    Wrap(
                                      direction: Axis.horizontal,
                                      alignment: WrapAlignment.center,
                                      spacing: 5.0,
                                      children: <Widget>[
                                        Chip(
                                          label: Text('Arte', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                                          backgroundColor: Colors.blue,
                                        ),
                                        Chip(
                                          label: Text('Ciencia ficción', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                                          backgroundColor: Colors.blue,
                                        ),
                                        Chip(
                                          label: Text('Tecnología', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                                          backgroundColor: Colors.blue,
                                        ),
                                        Chip(
                                          label: Text('Deportes', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                                          backgroundColor: Colors.blue,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                // FlatButton(
                //   child: Text('Salir', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
                //   onPressed: () => Navigator.pushReplacementNamed(context, 'login'),
                // )
              ],
            ),
          ),
        ),
      );
    }         
}