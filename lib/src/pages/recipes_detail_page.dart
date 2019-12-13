import 'package:flutter/material.dart';

class RecipeDetailPage extends StatefulWidget {
  @override
  _RecipeDetailPageState createState() => _RecipeDetailPageState();
}

class _RecipeDetailPageState extends State<RecipeDetailPage> {
  @override
  Widget build(BuildContext context) {
    dynamic receta = ModalRoute.of(context).settings.arguments;
    Map etiquetas = receta['etiquetas'];
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _appBar(receta),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Card(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Ingredientes', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                          Text(receta['ingredientes']),
                          Divider(height: 30.0),
                          Text('Procedimiento', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                          Text(receta['procedimiento'], textAlign: TextAlign.justify,),
                          Divider(height: 30.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Text('Porciones', style: TextStyle(fontWeight: FontWeight.bold)),
                                  Text("${receta['porciones']}")
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Text('Tiempo(min)', style: TextStyle(fontWeight: FontWeight.bold)),
                                  Text("${receta['tiempo_preparacion']}")
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Text('Costo', style: TextStyle(fontWeight: FontWeight.bold)),
                                  Text("${receta['costo']}")
                                ],
                              )
                            ],
                          ),
                          Divider(height: 30.0),
                          Text('Etiquetas', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                          Wrap(
                            direction: Axis.horizontal,
                            alignment: WrapAlignment.center,
                            spacing: 5.0,
                            children: <Widget>[
                              Chip(
                                label: Text('Barato', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                                backgroundColor: (etiquetas['Barato']) ? Colors.blue : Colors.grey,
                              ),
                              Chip(
                                label: Text('Fácil', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                                backgroundColor: (etiquetas['Fácil']) ? Colors.blue : Colors.grey,
                              ),
                              Chip(
                                label: Text('Inusual', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                                backgroundColor: (etiquetas['Inusual']) ? Colors.blue : Colors.grey,
                              ),
                              Chip(
                                label: Text('Rápido', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                                backgroundColor: (etiquetas['Rápido']) ? Colors.blue : Colors.grey,
                              ),
                              Chip(
                                label: Text('Saludable', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                                backgroundColor: (etiquetas['Saludable']) ? Colors.blue : Colors.grey,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ]
            ),
          )
        ],
      ),
    );
  }

  Widget _appBar(dynamic receta){
    return SliverAppBar(
      leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () => Navigator.pop(context)),
      automaticallyImplyLeading: false,
      elevation: 2.0,
      backgroundColor: Colors.blue,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(receta['nombreReceta'], style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
        background: FadeInImage(
          image: NetworkImage(receta['foto_url']),
          placeholder: AssetImage('assets/loading.gif'),
          fadeInDuration: Duration(microseconds: 150),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}