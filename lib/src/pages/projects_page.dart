import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProjectsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Proyectos'),
      ),
      body: Container(
        child: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection('proyectos').snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(snapshot.hasError)
              return Text('${snapshot.error}');
            switch(snapshot.connectionState){
              case ConnectionState.waiting: return Center(child: CircularProgressIndicator());
              default:
                return ListView(
                  children: snapshot.data.documents.map<Widget>((DocumentSnapshot document){
                    return Container(
                      height: 125.0,
                      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.5),
                      child: Card(
                        child: FlatButton(
                          child: Container(
                            padding: EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(document['titulo'], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                                    (document['tipoRemuneracion']) ? Icon(Icons.attach_money) : Icon(Icons.money_off)
                                  ],
                                ),
                                Text(document['autor'], style: TextStyle(fontWeight: FontWeight.w400, color: Colors.blueGrey)),
                                Row(
                                  children: <Widget>[
                                    Icon(Icons.access_time),
                                    SizedBox(width: 5.0,),
                                    Text("${document['duracion']} días")
                                  ],
                                )
                              ],
                            ),
                          ),
                          onPressed: () => Navigator.pushNamed(context, 'project_detail', arguments: document),
                        )
                      ),
                    );
                  }).toList(),
                );
            }
          },
        ),
      ),
      floatingActionButton: _btnCrearProyecto(context),
    );
  }

  _btnCrearProyecto(BuildContext context){
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () => Navigator.pushNamed(context, 'projects_form'),
    ); 
  }
}