import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdvicesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consejos'),
      ),
      body: Container(
        child: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection('consejos').snapshots(),
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
                                Text( '"'+ document['detalle'] + '"', textAlign: TextAlign.center, style: TextStyle(fontSize: 17.5, fontWeight: FontWeight.w500),),
                                Divider(indent: 60.0, endIndent: 60.0, color: Colors.blueGrey,),
                                Text(document['usuario'], style: TextStyle(color: Colors.grey),)
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
      floatingActionButton: _btnCrearConsejo(context),
    );
  }
  _btnCrearConsejo(BuildContext context){
    return FloatingActionButton(
      // backgroundColor: Color.fromRGBO(26, 49, 99, 39),
      child: Icon(Icons.add),
      onPressed: () => Navigator.pushNamed(context, 'advices_form'),
    ); 
  }
}