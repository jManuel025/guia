import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:guiaestudiante/src/models/advices_model.dart';

class FavAdvicesPage extends StatefulWidget {
  @override
  _FavAdvicesPageState createState() => _FavAdvicesPageState();
}

class _FavAdvicesPageState extends State<FavAdvicesPage> {
  final favConsejos = Firestore.instance.collection('favConsejos').document(prefs.uid).snapshots();
  
  @override
  Widget build(BuildContext context){
    print(favConsejos);
    return Scaffold(
      appBar: AppBar(
        title: Text('Consejos'),
      ),
      body: Container(
        // child: Column(),
        // child: _favAdvices(),
        child: StreamBuilder<DocumentSnapshot>(
          stream: favConsejos,
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(snapshot.hasError) return Text('${snapshot.error}');
            switch(snapshot.connectionState){
              case ConnectionState.waiting: return Center(child: CircularProgressIndicator());
              default:
                return ListView(
                  children: snapshot.data.documents.map<Widget>(
                    (DocumentSnapshot document){
                      return Container(
                      // height: 125.0,
                      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.5),
                      child: Card(
                        child: Container(
                          padding: EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(document['claveConsejo'], style: TextStyle(color: Colors.grey),)
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                  ).toList(),
                );
            }
          },
        ),
      ),
    );
  }

    // Widget _favAdvices(){
      // Future<dynamic> consejos = _getAdvicesIds();
      // return Container(
      //   child: FutureBuilder(
      //     future: consejos,
      //     builder: (BuildContext context, AsyncSnapshot snapshot){
      //       if(snapshot.hasError) return Text('${snapshot.error}');
      //       switch(snapshot.connectionState){
      //         case ConnectionState.waiting : return Center(child: CircularProgressIndicator());
      //         default:
      //           List<dynamic> claves = snapshot.data; 
      //           for(int x = 0; x <= claves.length; x++){
      //             print(claves[x]);
      //           }
      //       }
      //     },
      //   )
      // );
    // }

    // _getAdvicesIds() async{
      // DocumentSnapshot favConsejos = await Firestore.instance.collection('fav_consejos').document(prefs.uid).get();
      // Map<dynamic, dynamic> mapaConsejos = favConsejos.data;
      // final keyConsejos = [];
      // mapaConsejos.forEach((k,v) => keyConsejos.add(k));
      // List consejosArr = [];
      // for(int x = 0; x <= keyConsejos.length; x++){
      //   DocumentSnapshot elemento = await Firestore.instance.collection('consejos').document(keyConsejos[x]).get();
      //   consejosArr.add(elemento.data);
        
      // }
      // print(keyConsejos);
      // return keyConsejos;
    // }
}